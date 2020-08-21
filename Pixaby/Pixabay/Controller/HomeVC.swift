
import CHTCollectionViewWaterfallLayout
import Alamofire
import SDWebImage
import CoreData
import SVProgressHUD
import NVActivityIndicatorView

class HomeVC: UIViewController {
        
    @IBOutlet weak var lblSuggection: UILabel!
    @IBOutlet weak var viewHeadSearch: UIView!
    
    @IBOutlet weak var tblViewHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var txtFieldSearch: UITextField!{
        didSet{
            txtFieldSearch.attributedPlaceholder = NSAttributedString(string: "Search here",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: Constants.Colors.AppDarkGrayColor.value])
            
        }
    }
    let layout = CHTCollectionViewWaterfallLayout()
    
    @IBOutlet weak var tblViewSearch: UITableView!{
        didSet{
            tblViewSearch.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        }
    }
    
    @IBOutlet weak var colViewImages: UICollectionView!{
        didSet{
            
            layout.minimumColumnSpacing = 1.0
            layout.minimumInteritemSpacing = 1.0
            layout.footerHeight = 0
            colViewImages.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            colViewImages.alwaysBounceVertical = true
            colViewImages.collectionViewLayout = layout
            colViewImages.register(UINib(nibName: "ImageCVC", bundle: nil), forCellWithReuseIdentifier: "ImageCVC")
            colViewImages.register(UINib(nibName: "FooterColReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier:"FooterColReusableView")
            colViewImages.dataSource = self
            colViewImages.delegate = self
        }
    }
    var imageData: [Hits]?
    var pageNumber = 1
    var arraySearchSuggestions = [DataViewModel]()
    var searchedSuggestions = [DataViewModel]()
    var searchActive : Bool = false
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colViewImages.isHidden = true
        lblSuggection.isHidden = false
        self.view.addGradientWith(direction: .horizontal, and: Constants.Colors.AppGradColorFirst.value,Constants.Colors.AppGradColorSecond.value)
    }
    
    //    MARK:- Handling the height of tableView
    override func viewDidLayoutSubviews() {
        self.tblViewHeightCnst.constant = CGFloat(self.tblViewSearch.contentSize.height)
    }
    
    //    MARK:- Network Call
    
    public func callApi(with text:String,pageNumber:Int){
        if pageNumber == 1{
            SVProgressHUD.show()
            imageData?.removeAll()
            colViewImages.reloadData()
        }
        
        let formattedString = text.replacingOccurrences(of: " ", with: "+")
        
        let finalText = formattedString.trimmingCharacters(in: NSCharacterSet.whitespaces)
        
        AF.request("\(Constants.Defaults.BASE_URL)key=\(Constants.Defaults.pixApiKey)&q=\(finalText)&image_type=photo&page=\(pageNumber)&per_page=20",method: .get).responseJSON { [weak self](response) in
            
            guard let self = self else{
                return
            }
            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                print(response.error!)
                return
            }
            // make sure we got some JSON since that's what we expect
            guard let json = response.value as? [String: Any] else {
                if let error = response.error {
                    print("Error: \(error)")
                }
                return
            }
            if let data = json["hits"] as? [Any]{
                if data.count>0{
                    
                    self.layout.footerHeight = 50
                    if pageNumber>1{
                        let tempArr = Hits.modelsFromDictionaryArray(array: data as NSArray)
                        for hits in tempArr{
                            self.imageData?.append(hits)
                        }
                    }else{
                        self.imageData = Hits.modelsFromDictionaryArray(array: data as NSArray)
                    }
                    if (CoreDataManager.shared.isExist(value: text)) == false{
                        CoreDataManager.shared.saveDataToCoreData(value: text)
                    }
                    self.lblSuggection.isHidden = true
                    self.colViewImages.isHidden = false
                    self.colViewImages.reloadData()
                    
                }else{
                    self.showAlert(title: "Pixabay", message: "Oops! No Results Found")
                    self.lblSuggection.isHidden = false
                    self.colViewImages.isHidden = true
                    self.layout.footerHeight = 0
                }
                SVProgressHUD.dismiss()
            }
        }
    }
}
//    MARK:- CollectionView Delegate
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCVC", for: indexPath) as! ImageCVC
        cell.imgViewPicture.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imgViewPicture.sd_imageIndicator?.startAnimatingIndicator()
        cell.imgViewPicture.sd_setImage(with: URL(string: self.imageData?[indexPath.row].previewURL ?? ""), completed: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if imageData!.count > 0{
            
            let imgWidth = Float(imageData![indexPath.row].previewWidth!)
            let imgHeight = Float(imageData![indexPath.row].previewHeight!)
            
            let aspectRatio = CGFloat(imgHeight/imgWidth)
            
            return CGSize(width: CGFloat(collectionView.frame.size.width/2), height: CGFloat(CGFloat(collectionView.frame.size.width/2) * aspectRatio))
            
        }
        return CGSize(width: 0,height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let picFullVC = self.storyboard?.instantiateViewController(identifier: "PicFullVC") as! PicFullVC
        picFullVC.model = imageData
        picFullVC.index = indexPath.item
        self.navigationController?.pushViewController(picFullVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterColReusableView", for: indexPath) as! FooterColReusableView
        
        return reusableView
    }
    
    
    //    MARK:- Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if ((colViewImages.contentOffset.y + colViewImages.frame.size.height ) >= colViewImages.contentSize.height - 50)
        {
            pageNumber += 1
            callApi(with: txtFieldSearch.text!, pageNumber:pageNumber)
            colViewImages.reloadData()
        }
    }
    
}
//MARK:- TextField Delegate
extension HomeVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !(textField.text!.isEmpty){
            callApi(with: textField.text!,pageNumber: 1)
            self.tblViewSearch.isHidden = true
        }
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            if updatedText.count > 2{
                CoreDataManager.shared.fetchDataFromCoreData(searchedValue: updatedText) { [weak self](result) in
                    guard let self = self else {
                        return
                    }
                    if let suggestions = result{
                        self.arraySearchSuggestions = suggestions
                        self.arraySearchSuggestions.reverse()
                        
                        if self.arraySearchSuggestions.count > 10{
                            self.arraySearchSuggestions.remove(at: 10)
                        }
                        
                        searchedSuggestions = arraySearchSuggestions.filter({ (data) -> Bool in
                            let searchValue =  data.searchValue!
                            let range = searchValue.range(of: updatedText, options: NSString.CompareOptions.caseInsensitive)
                            return range != nil
                        })
                        searchActive = true
                        if (updatedText  == "") {
                            searchActive = false
                        }
                        
                        self.tblViewSearch.isHidden = false
                        self.tblViewSearch.invalidateIntrinsicContentSize()
                        
                        self.tblViewSearch.reloadData()
                    }
                }
            } else {
                searchActive = false
                self.tblViewSearch.reloadData()
            }
        }
        return true
    }
}
