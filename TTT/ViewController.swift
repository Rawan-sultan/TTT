import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var but1: UIButton!
    
    @IBOutlet weak var but2: UIButton!
    
    @IBOutlet weak var but3: UIButton!
    
    @IBOutlet weak var but4: UIButton!
    
    @IBOutlet weak var but5: UIButton!
    
    @IBOutlet weak var but6: UIButton!
    
    @IBOutlet weak var but7: UIButton!
    
    @IBOutlet weak var but8: UIButton!
    
    @IBOutlet weak var but9: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var Label: UILabel!
    
    var gameBoard = [UIButton]()
    var bLue = UIColor.blue
    var rEd = UIColor.red
    
    
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    
    
    var count = 1
    var activePlayer = 1
    var firstPlayer = 1
    var Player1 = 1
    var Player2 = 2
    var gameIsActive = true
    var index = 0
    var index2 = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initgameBoard()
        Label.isHidden = true    }
    func initgameBoard() {
        gameBoard.append(but1)
        gameBoard.append(but2)
        gameBoard.append(but3)
        gameBoard.append(but4)
        gameBoard.append(but5)
        gameBoard.append(but6)
        gameBoard.append(but7)
        gameBoard.append(but8)
        gameBoard.append(but9)
    }
    
    @IBAction func ss(_ sender:UIButton){
        
        changColor(sender)
            if victory(playerTag: rEd){
                Label.isHidden = false
                Label.text = "The Red Wins !!!"
                
                gameIsActive = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                }
                
            }
            if victory(playerTag: bLue){
                Label.isHidden = false
                Label.text = "The Blue Wins !!!"
                gameIsActive = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                }
            }
        
        if checkColors() && gameIsActive {
            Label.isHidden = false
            Label.text = "it is a Draw"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            }
        }
        
        
    }
    func victory(playerTag: UIColor) -> Bool {
        
        //Horisontall
        if winningmatch(pl1_Or_2: playerTag, but1) && winningmatch(pl1_Or_2: playerTag, but2) && winningmatch(pl1_Or_2: playerTag, but3)  {
            return true
            
        }
        
        if winningmatch(pl1_Or_2: playerTag, but4) && winningmatch(pl1_Or_2: playerTag, but5) && winningmatch(pl1_Or_2: playerTag, but6)  {
            return true
            
        }
        if winningmatch(pl1_Or_2: playerTag, but7) && winningmatch(pl1_Or_2: playerTag, but8) && winningmatch(pl1_Or_2: playerTag, but9)  {
            return true
            
        }
        //Virtaclly
        if winningmatch(pl1_Or_2: playerTag, but1) && winningmatch(pl1_Or_2: playerTag, but5) && winningmatch(pl1_Or_2: playerTag, but7)  {
            return true
            
        }
        
        if winningmatch(pl1_Or_2: playerTag, but2) && winningmatch(pl1_Or_2: playerTag, but4) && winningmatch(pl1_Or_2: playerTag, but8)  {
            return true
            
        }
        if winningmatch(pl1_Or_2: playerTag, but3) && winningmatch(pl1_Or_2: playerTag, but6) && winningmatch(pl1_Or_2: playerTag, but9)  {
            return true
            
        }
        //Diagonal
        if winningmatch(pl1_Or_2: playerTag, but1) && winningmatch(pl1_Or_2: playerTag, but4) && winningmatch(pl1_Or_2: playerTag, but9)  {
            return true
            
        }
        
        if winningmatch(pl1_Or_2: playerTag, but3) && winningmatch(pl1_Or_2: playerTag, but4) && winningmatch(pl1_Or_2: playerTag, but7)  {
            return true
            
        }
        return false
    }
    func winningmatch(pl1_Or_2 : UIColor, _ button:UIButton) -> Bool{
        return pl1_Or_2 == button.backgroundColor
        
    }
    
    
    func checkColors() -> Bool {
        for button in gameBoard {
            if button.backgroundColor != bLue && button.backgroundColor != rEd{
                return false
            }
            
        }
        return true
    }
    @IBAction  func resetGame(){
        for button in gameBoard {
            button.backgroundColor = UIColor.systemGray
            button.tag = 0
            button.isEnabled = true
            //se
        }
        if firstPlayer == 1{
            firstPlayer = 2
        }
        else if firstPlayer == 2{
            firstPlayer = 1
        }
        activePlayer = firstPlayer
        Label.isHidden = true
        gameIsActive = true
    }
    
    func changColor(_ sender: UIButton) {
        if activePlayer == 1 {
            sender.backgroundColor = bLue
            sender.tag = Player1
            activePlayer = 2
        }
        else if activePlayer == 2 {
            sender.backgroundColor = rEd
            sender.tag = Player2
            activePlayer = 1
        }
        sender.isEnabled = false
    }
    
}
