//
//  ViewController.swift
//  BingoGame01
//
//  Created by 井上航 on 2015/12/16.
//  Copyright © 2015年 Wataru Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    // 空（要素数０）の配列を宣言
//    var myArray = [String]() //myArrayという名前のString型の要素を格納できる配列
//    
//    func chengeArray(){
//        myArray[0] = "りんご" //エラー 添字０には要素がまだ存在しない
//        myArray.append("りんご") //ok これでmyArrayは要素数１つの配列になった
//        myArray[0] = "すいか" //ok　添字０には要素が既に存在するから書き換えできた
//    }
//    
//    var num01: Int = 0
//    
//    // plusFiveという名前の関数を宣言。numに５を加算する（引き数なし、戻り値なし。）
//    func plusFive() {
//        num01 = num01 + 5
//    }
//    
//    // plusFiveHikiという名前の関数を宣言。numに５を加算する（引き数あり、戻り値なし。）
//    func plusFiveHiki(theNumber: Int) {
//        num01 = theNumber + 5
//    }
//    
//    // plusFiveHikiという名前の関数を宣言。numに５を加算する（引き数あり、戻り値あり。）
//    // 実行するときは関数自体がInt型の変数であるようなイメージ
//    func plusFiveHikiModo(theNumber: Int) -> Int {
//        var num02: Int = 0
//        
//        num02 = theNumber + 5
//        
//        return num02
//    }
    
    // 結果表示ラベル
    @IBOutlet weak var resultLabel: UILabel!
    
    // storyboardで配置したUILabelを関連付け
    @IBOutlet weak var label00: UILabel!
    @IBOutlet weak var label01: UILabel!
    @IBOutlet weak var label02: UILabel!
    @IBOutlet weak var label03: UILabel!
    @IBOutlet weak var label04: UILabel!
    @IBOutlet weak var label05: UILabel!
    @IBOutlet weak var label06: UILabel!
    @IBOutlet weak var label07: UILabel!
    @IBOutlet weak var label08: UILabel!
    @IBOutlet weak var label09: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label24: UILabel!
    
//    var cardArray = [[AnyObject]]() // [UILabel, randomNumber, hitCheck]
    
    // セル（２５このボックスのこと）用の配列を宣言
    var cellLabelArray = [UILabel]() // UILabelを配列の要素とリンクするための配列
    var cellNumbarArray = [Int]() // セルに表示する数字を格納する配列
    var cellHitCheckArray = [Bool]() // 穴が開いているか否か Bool型: true or false
    //この３つがセット
    
    var pickedNumberArray = [Int]() // ガラガラで出た数字を格納しておく
    var reachCount = 0 // ビンゴ判定で使用。リーチの数
    var bingoCount = 0 // ビンゴ判定で使用。ビンゴの数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cellLabelArray.append(label00)
        cellLabelArray.append(label01)
        cellLabelArray.append(label02)
        cellLabelArray.append(label03)
        cellLabelArray.append(label04)
        cellLabelArray.append(label05)
        cellLabelArray.append(label06)
        cellLabelArray.append(label07)
        cellLabelArray.append(label08)
        cellLabelArray.append(label09)
        cellLabelArray.append(label10)
        cellLabelArray.append(label11)
        cellLabelArray.append(label12)
        cellLabelArray.append(label13)
        cellLabelArray.append(label14)
        cellLabelArray.append(label15)
        cellLabelArray.append(label16)
        cellLabelArray.append(label17)
        cellLabelArray.append(label18)
        cellLabelArray.append(label19)
        cellLabelArray.append(label20)
        cellLabelArray.append(label21)
        cellLabelArray.append(label22)
        cellLabelArray.append(label23)
        cellLabelArray.append(label24)
        
        initiate()
        
//        //関数の実行
//        plusFive() // num01 = 0 -> 5
//        
//        plusFiveHiki(2) // num01 = 5 -> 7
//        plusFiveHiki(num01) //num01 = 7 -> 14
//        
//        num01 = plusFiveHikiModo(3) // num01 = 14 -> 17
//        num01 = plusFiveHikiModo(num01) // num01 = 17 -> 34
//        
//        
//        let shikiArray:[String] = ["春","夏","秋","冬"] // String型の４つの要素を持つ配列を宣言
//        
//        for i in 0 ..< shikiArray.count { // shikiArray.count は 4、よって４回ループ
//            print(String(shikiArray[i])) // 添字iのshikiArrayの要素をコンソールに出力
//        }
//        
    }
    
    // 配列を初期化
    func initiate(){
        
        // セルの数字と穴の配列の初期化
        cellNumbarArray = []
        cellHitCheckArray = []
        
        pickedNumberArray = []
        
        for i in 0 ..< cellLabelArray.count {
            cellNumbarArray.append (0)
            cellHitCheckArray.append(false)
        }
        
    }
    
    // カードのセルのラベルを表示
    func display() {
        // 各セルについて実行
        for i in 0 ..< cellLabelArray.count {
            // セルに数字を表示
            cellLabelArray[i].text = String(cellNumbarArray[i])
            
            if cellHitCheckArray[i] == true {
                // 穴が開いていたらセル内の背景色を赤、文字色を白に
                cellLabelArray[i].backgroundColor = UIColor.redColor()
                cellLabelArray[i].textColor       = UIColor.whiteColor()
            } else {
                // 穴が開いていなかったらセル内の背景色を白、文字色を黒に
                cellLabelArray[i].backgroundColor = UIColor.whiteColor()
                cellLabelArray[i].textColor       = UIColor.blackColor()
            }
        }
        // ガラガラを１回以上やっている時
        if pickedNumberArray.isEmpty == false {
            // 結果表示ラベルに文字列を準備:ex"3回目:21"
            var resultString = String("\(pickedNumberArray.count)回目:\(pickedNumberArray.last!)")
            // リーチ、ビンゴがあったら追記
            if reachCount != 0 {
                resultString += ", \(reachCount)リーチ!"
            }
            if bingoCount != 0 {
                resultString += ", \(bingoCount)ビンゴ!!!"
            }
            // ラベルに表示
            resultLabel.text = resultString
        }
    }
    
    // カードを生成
    func makeCard() {
        for i in 0...24 {
            // 各セルの数字を乱数で生成、配列に格納
            cellNumbarArray[i] = Int(arc4random_uniform(UInt32(50)))
        }
    }
    
    // 「カード生成」ボタンが押された時
    @IBAction func cardMakeButtonTapped(sender: UIButton) {
        initiate()
        makeCard()
        display()
        resultLabel.text = String("カード完成")
    }
    
    // ガラガラの数字とラベルの数値の一致判定
    func hantei(hanteinumber: Int){
        // 各セルをチェック
        for i in 0 ..< cellLabelArray.count {
            // ガラガラとセルの中の数字が一致していたら
            if cellNumbarArray[i] == hanteinumber {
                // セルに穴をあける
                cellHitCheckArray[i] = true
            }
        }
    }
    
    // ビンゴ（リーチ）判定
    func bingoHantei() {
        // 一列の中での穴の数を格納する
        var hitCount = 0
        
        // カードの中のリーチ、ビンゴの数を初期化
        reachCount = 0
        bingoCount = 0
        
        // 横列を１列ずつ（全部で５列）判定
        for i in 0 ..< 5 {
            hitCount = 0
            // セルの穴を１つずつチェック
            for j in 0 ..< 5 {
                if cellHitCheckArray[i*5+j] == true {
                    hitCount++
                }
            }
            if hitCount == 4 {
                reachCount++
            }
            if hitCount == 5 {
                bingoCount++
            }
        }
        
        // 縦列を１列ずつ（全部で５列）判定
        for i in 0 ..< 5 {
            hitCount = 0
            // セルの穴を１つずつチェック
            for j in 0 ..< 5 {
                if cellHitCheckArray[j*5+i] == true {
                    hitCount++
                }
            }
            if hitCount == 4 {
                reachCount++
            }
            if hitCount == 5 {
                bingoCount++
            }
        }
        
        // 斜め（左上から右下）の１列を判定
        hitCount = 0
        // セルの穴を１つずつチェック
        for i in 0 ..< 5 {
            if cellHitCheckArray[i*5+i] == true {
                hitCount++
            }
        }
        if hitCount == 4 {
            reachCount++
        }
        if hitCount == 5 {
            bingoCount++
        }
        
        // 斜め（右上から左下）の１列を判定
        hitCount = 0
        // セルの穴を１つずつチェック
        for i in 0 ..< 5 {
            if cellHitCheckArray[i*5+4-i] == true {
                hitCount++
            }
        }
        if hitCount == 4 {
            reachCount++
        }
        if hitCount == 5 {
            bingoCount++
        }
    }
    
    // 「ガラガラ」ボタンが押された時
    @IBAction func pickNumberButtonTapped(sender: UIButton) {
        let pickNumber = Int(arc4random_uniform(UInt32(50)))
        pickedNumberArray.append(pickNumber)
        hantei(pickNumber)
        bingoHantei()
        display()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}