import Foundation

//Воин Колдун Медик Защитник
//У каждого по 1000 xp изначально (у защитника 1500)
//Каждый раунд наносят удар по 200 300 0 100
//Медик лечит один раз в 2 раунда всю команду на 200хп
//Медик наносить удар не может


//Босс
//5000хп изначально
//Наносит по 200 хп урона каждому игроку в течении игры пока не умрет

//Игра закончится когда умрет Босс и жив хотябы один игрок,либо когда все игроки мертвы,а Босс и жив


var warriors = ["Warrior", "Witch",  "healer", "defender"]
let warriorsDMG = [200, 300, 0, 100]
var warriorsXP = [1000,1000,1000,1_500]

var killedWarriors = [String]()
var rounds = 0
var playersData: [String:Int] = ["Warrior":0, "Witch": 0, "healer": 0, "defender": 0, "BOSS": 0]

func game(){
    while bossxp != 0 || killedWarriors.count == warriors.count{
        for i in 0..<warriors.count{
            
            if bossxp == 0 || killedWarriors.count == warriors.count{
                break
            } else {
                round += 1
                if round % 2 == 0{
                    warriorsXP[i] += 200
                }
                
                bossxp -= warriorsDMG[i]
                warriorsXP[i] -= bossdmg
                

                playersData[warriors[i]]! += warriorsDMG[i]
                playersData["BOSS"]! += bossdmg
                
            }
            
            if warriorsXP[i] == 0{
                killedWarriors.append(warriors[i])
            }
        }
    }
    
    func determineTheWinner(){
        if killedWarriors.count == warriors.count{
            print("Босс победил. Данные об игре: Количество раундов: \(round). Данные об игроках: \(playersData)")
        } else if bossxp == 0 && killedWarriors.count != warriors.count{
            print("Игроки победили. Данные об игре: Количество раундов: \(round). Данные об игроках: \(playersData)")
        }
    }
    
    determineTheWinner()
}
game()
