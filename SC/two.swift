//
//  ViewController.swift
//  SC
//
//  Created by YZQ on 16/5/5.
//  Copyright © 2016年 YZQ. All rights reserved.
//

import UIKit

class two: UIViewController {
   
    var db:SQLiteDB!
    var time:NSTimer!
    var timer:Int = 0
    @IBOutlet weak var TEAMICE: UITextField!
    @IBOutlet weak var TEAMFIRE: UITextField!
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var time2: UILabel!
    var FIREgrade:String = ""
    var ICEgrade:String = ""
    var operand1:String = ""
    var operand2:String = ""
    var grade1 = 0
    var grade2 = 0
   
 
    
    @IBOutlet var txtUname: UITextField!
    @IBOutlet var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Start(sender: UIButton) {
        time = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:Selector("tickDown"),userInfo:nil,repeats: true)
    }
    
    func tickDown(){
        timer++
        let sec = timer%60
        let min = timer/60
        time1.text = String (min)
        time2.text = String (sec)
        saveUser()
    }
    @IBAction func AC(sender: UIButton) {
        let value = sender.currentTitle!
        if value == "清空分数" {
            FIREgrade = ""
            ICEgrade = ""
            TEAMFIRE.text = "0"
            TEAMICE.text = "0"
            grade1 = 0
            grade2 = 0
            return
        }

    }
    @IBAction func Stop(sender: UIButton) {
        time.invalidate()
        saveUser()
    }
       @IBAction func ADD(sender: UIButton) {
        let value = sender.currentTitle!
        
        if value == "FIRE1"||value == "FIRE2"||value == "FIRE3" {
            
            operand1 = value
            switch operand1 {
                case "FIRE1":
                    grade1 = grade1 + 1
                    TEAMFIRE.text = "\(grade1)"
                case "FIRE2":
                    grade1 = grade1 + 2
                    TEAMFIRE.text = "\(grade1)"
                case "FIRE3":
                    grade1 = grade1 + 3
                    TEAMFIRE.text = "\(grade1)"
                default:
                    grade1 = 0
                
            }
        }
        
        else if value == "ICE1"||value == "ICE2"||value == "ICE3" {
            
            operand2 = value
            switch operand2 {
            case "ICE1":
                grade2 = grade2 + 1
                TEAMICE.text = "\(grade2)"
            case "ICEd2":
                grade2 = grade2 + 2
                TEAMICE.text = "\(grade2)"
            case "ICE3":
                grade2 = grade2 + 3
                TEAMICE.text = "\(grade2)"
            default:
                grade2 = 0
                
            }
        }

       
    }
    
    
}

