//
//  BaseController.swift
//  testProj
//
//  Created by Firdous on 30/12/2015.
//  Copyright © 2015 TenPearls. All rights reserved.
//

import UIKit

//#define FILE_SUFFIX             @"Controller"
//#define INVALID_CLASS_NAME      @"Invalid class name. Name should end with string 'controller' (e.g. SampleController)"
//#define TYPE_VIEW               @"View"
//#define TYPE_NIB                @"nib"
//#define NIB_NOT_FOUND           @"%@ nib/class not found in project."
//#define NIB_DOESNT_HAVE_VIEW    @"%@ nib doesn't have any view (IB error)"
//#define NIB_SHOULD_BE_SUBCLASS  @"%@ nib should be subclass of %@ -> BaseView (IB error)."

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

}
