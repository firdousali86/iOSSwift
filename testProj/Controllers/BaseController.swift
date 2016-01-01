//
//  BaseController.swift
//  testProj
//
//  Created by Firdous on 30/12/2015.
//  Copyright © 2015 TenPearls. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func getViewName() -> String{
        let file = self.description
        do{
            if(!file.hasSuffix("Controller")){
                try self.throwException(ControllerExceptions.InvalidClassName)
            }
        }
        catch{
            print("Invalid class name. Name should end with string 'controller' (e.g. SampleController)")
        }
        return file.stringByReplacingOccurrencesOfString("Controller", withString: "View")
    }
    
    func throwException(message : ControllerExceptions) throws -> String {
        throw message
    }
    
    /*
    -(void)loadView:(NSString*)nib{
    
    if ([Utils isiPad]) {
    //nib = [nib stringByAppendingString:@"~ipad"];
    }
    
    if([[NSBundle mainBundle] pathForResource:nib ofType:@"nib"] == nil){
    [self throwExceptioin:[NSString stringWithFormat:@"%@ nib/class not found in project.",nib]];
    }
    
    UINib *nibs    = [UINib nibWithNibName:nib bundle:nil];
    NSArray *array = [nibs instantiateWithOwner:nil options:nil];
    if(array.count == 0){
    [self throwExceptioin:[NSString stringWithFormat:@"%@ nib doesn't have any view (IB error)",nib]];
    }
    
    if(![[array objectAtIndex:0] isKindOfClass:[BaseView class]]){
    [self throwExceptioin:[NSString stringWithFormat:@"%@ nib should be subclass of %@ -> BaseView (IB error).",nib,nib]];
    }
    
    BaseView *view  = (BaseView*)[array objectAtIndex:0];
    view.controller = self;
    self.view      = view;
    }
    */
    
    func loadView(var nib : String) throws {
        if(Utils.isiPad()){
            nib = nib.stringByAppendingString("~ipad");
        }
        
        guard NSBundle.mainBundle().pathForResource(nib, ofType: "nib") != nil else {
            throw ControllerExceptions.NibNotFound
        }
        
        let nibs = UINib.init(nibName: nib, bundle: nil)
        let array = nibs.instantiateWithOwner(nil, options: nil)
        
        guard array.count != 0 else {
            throw ControllerExceptions.NoViewInNib
        }
        
        guard let arr0 = array[0] as? BaseView else {
            throw ControllerExceptions.NibNotSubClassOfBaseView
        }
        
        let view : BaseView = array[0] as! BaseView

    }
}
