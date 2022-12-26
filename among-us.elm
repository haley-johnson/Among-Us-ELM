import Html
import Html.Attributes
{-
CREDITS
--------
Map - johnsh20
Wires Minigame - kehyayak
Passcode Minigame - zhouo2
Leaf minigame - johnsh20
Card Swipe Minigame - overallt & joshin10
-}

imgsrc = "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-7.png"

myShapes model =
    case model.state of
        Leaf -> 
          [ [Joshin10.Leaf0011.myShapes model.leafModel
              |> group
              |> GraphicSVG.map LeafMsg,
              rect 400 400
             |> filled black
             |> move (if (model.leafModel.hasWon) 
                                                  then (-45, 45) 
                                                  else (500, 500)),
             roundedRect 60 40 10 |> filled black |> addOutline (solid 1) (green) |> move (if (model.leafModel.hasWon)
                                                  then (0, 0) 
                                                  else (100, 100)) 
             |> notifyTap BackFromLeaf,
             text "Task Complete!" |> sansserif |> filled green |> move (if (model.leafModel.hasWon)
                                                  then (-40,30)
                                                  else (100,100)),
             text "Continue" |> sansserif |> filled green |> move (if (model.leafModel.hasWon) 
                                                  then (-25, -3) 
                                                  else (100, 100))  
             |> notifyTap BackFromLeaf
             ] |> group
          ]
        Wires -> 
          [ [Johnsh20.Wires.myShapes model.wiresModel
              |> group
              |> GraphicSVG.map WiresMsg,
              rect 400 400
             |> filled black
             |> move (if (model.wiresModel.hasWon) 
                                                  then (-45, 45) 
                                                  else (500, 500)),
             roundedRect 60 40 10 |> filled black |> addOutline (solid 1) (green) |> move (if (model.wiresModel.hasWon)  
                                                  then (0, 0) 
                                                  else (100, 100)) 
             |> notifyTap BackFromWires,
             text "Task Complete!" |> sansserif |> filled green |> move (if (model.wiresModel.hasWon) 
                                                  then (-40,30)
                                                  else (100,100)),
             text "Continue" |> sansserif |> filled green |> move (if (model.wiresModel.hasWon) 
                                                  then (-25, -3) 
                                                  else (100, 100))   
             |> notifyTap BackFromWires
             ] |> group
          ]
        Card -> 
          [ [Joshin10.Cardswrper1.myShapes model.cardModel
              |> group
              |> GraphicSVG.map CardMsg,
              rect 400 400
             |> filled black
             |> move (if (model.cardModel.hasWon)
                                                  then (-45, 45) 
                                                  else (500, 500)),
             roundedRect 60 40 10 |> filled black |> addOutline (solid 1) (green) |> move (if (model.cardModel.hasWon)  
                                                  then (0, 0) 
                                                  else (100, 100)) 
             |> notifyTap BackFromCard,
             text "Task Complete!" |> sansserif |> filled green |> move (if (model.cardModel.hasWon) 
                                                                          then (-40,30)
                                                                          else (100,100)),
             text "Continue" |> sansserif |> filled (if (model.cardModel.hasWon) then green else blue)
                                           |> move (if (model.cardModel.hasWon) 
                                           then (-25, -3) 
                                           else (100, 100))   
             |> notifyTap BackFromCard
             
             ] |> group
          ]
        Passcode ->
          [ [Zhouo2.PasscodeSequence.myShapes model.passcodeModel
              |> group
              |> GraphicSVG.map PasscodeMsg,
              rect 400 400
             |> filled black
             |> move (if (model.passcodeModel.win)
                                                  then (-45, 45) 
                                                  else (500, 500)),
             roundedRect 60 40 10 |> filled black |> addOutline (solid 1) (green) |> move (if (model.passcodeModel.win)  
                                                  then (0, 0) 
                                                  else (100, 100)) 
             |> notifyTap BackFromPasscode,
             text "Task Complete!" |> sansserif |> filled green |> move (if (model.passcodeModel.win)
                                                  then (-40,30)
                                                  else (100,100)),
             text "Continue" |> sansserif |> filled green |> move (if (model.passcodeModel.win)
                                                  then (-25, -3) 
                                                  else (100, 100))   
             |> notifyTap BackFromPasscode
             
             ] |> group
          ]
        Cafeteria  ->
            [ rect 400 400
               |> filled black
               
             , rect 75 7
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(0,0)
               
             , rect 1.5 31
               |> filled green
               |> move(-5, -19)
               
             , ngon 9 35
              |> filled blue
              |> addOutline (solid 1) (green)
              |> move (55,0)
              
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (50,27)
     
            , text "Cafeteria"
                  |> centered
                  |> filled black
                  |> move (55,-2)
            , group
                  [ rect 55 45
                     |> filled black
                     |> addOutline (solid 1) (green)
                     |> move(-65, 0)
                  , text "Upper Engine"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(-66, -2)
                  ]
                     |> notifyTap CafToUE
            , group
                  [ rect 35 25
                     |> filled black
                     |> addOutline (solid 1) (green)
                     |> move(-5, -47) 
                  ,   text "Medbay"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(-5, -50)
                  ]
                     |> notifyTap CafToMB
            ]
        UpperEngine  ->
            [ rect 400 400
               |> filled black
               
              , rect 75 45
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-0.5, 35)
                
              , rect 100 0.5
                |> filled green
                |> move (0,-20)
                
              , rect 5 49
                |> filled blue
                |> addOutline (solid 1) (green)
                |> move (0,-12.5)

            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (-3,30)
               
           , text "Upper Engine"
                  |> filled black
                  |> move(-34, 35)
            , group
                  [ rect 40 25 -- reactor
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (-70,-17)
                  , text "Reactor"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(-70, -20)
                  ]
                     |> notifyTap UEtoReactor
            , group
                  [ rect 60 25 -- lower engine
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (0,-50)
                  ,   text "Lower Engine"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(0, -53)
                  ]
                     |> notifyTap UEtoLE
            , group
                  [ rect 40 25 
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (70,-17)
                   ,   text "Security"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(70, -20)
                  ]
                     |> notifyTap UEtoSecurity
            ]
        MedBay  ->
            [rect 400 400
               |> filled black
               
              , rect 75 65
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-5, -47)
               
              , rect 4 31
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-5, 1) 
               
              , rect 170 1
               |> filled green
               |> move(55, 17) 
               
               , text "MedBay"
                  |> centered
                  |> filled black
                  |> move (-5,-35)

            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (-10,-40)
                  
            , group 
                  [ rect 60 45 -- upper engine
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (-60,20)
                 ,    text "Upper Engine"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(-60, 17)
                  ]
                     |> notifyTap MedBayToUE
            ]
        Reactor  ->
            [rect 400 400
               |> filled black
               
              , rect 100 1
               |> filled green
               |> move(5, 0)  
               
              , rect 1 33
               |> filled green
               |> move(15, -16)  
               
              , rect 55 60
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-60, -10)
                
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (-68,-15)
            
            , circle 7
              |> filled yellow
              |> move (-60, 7)
              |> notifyTap GoToLeaf
              
            , text "!"
              |> filled orange
              |> move (-62,4)
              |> notifyTap GoToLeaf
                                          
              ,text "Reactor"
                  |> filled black
                  |> move (-79,-10)
            , group
                  [ rect 55 25
                    |> filled black
                    |> addOutline (solid 1) (green)
                    |> move (14,-45)
                   ,    text "Lower Engine"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(14, -48)
                  ]
                     |> notifyTap ReactorToLE
            , group
                  [ rect 40 35
                    |> filled black
                    |> addOutline (solid 1) (green)
                    |> move (75,0)
                   ,    text "Security"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(75, -2)
                  ]
                     |> notifyTap ReactorToSecurity
            ]
        LowerEngine  ->
            [rect 400 400
               |> filled black
               
              , rect 75 55
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-55, 47)  
               
              , rect 6 45
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-56, -3) 
               
              , rect 105 1
               |> filled green
               |> move(0, -25.5) 
               
               , rect 1 45
               |> filled green
               |> move(20, -3)   
                
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (-60,40)  
            
             , text "Lower Engine"
                |> filled black
                |> move(-88.5, 45)
                
            , group
                  [ rect 40 43 -- elec
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (20,41.3)
                  ,     text "Electrical"
                            |> size 8
                            |> filled green
                            |> move(5, 40)
                  ]
                     |> notifyTap LEtoElectrical
            , group
                  [ rect 40 40 -- storage
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (73,-25)
                   ,    text "Storage"
                            |> size 8
                            |> filled green
                            |> move(61, -25)
                  ]
                     |> notifyTap LEtoStorage
            ]
        Security  ->
            [ rect 400 400
               |> filled black 
            
               ,rect 55 75
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(65, 10)
                
               , rect 91 1
               |> filled green
               |> move(-8, 5) 
                         
               , rect 1 42
               |> filled green
               |> move(-5, -16)  
               
            , circle 7
              |> filled yellow
              |> move (67, -13)
              |> notifyTap GoToPasscode
              
            , text "!"
              |> filled orange
              |> move (65,-16.5) 
              |> notifyTap GoToPasscode
              
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (60,15)
            
            , text "Security"
                  |> centered
                  |> filled black
                  |> move(65,25)
                  
            , group
            
                  [ rect 40 25 -- reactor
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (-73,7) 
                  ,     text "Reactor"
                            |> centered
                            |> size 8
                            |> filled green
                            |> move(-73, 5)
                  ]
                     |> notifyTap SecurityToReactor
            , group
                  [ rect 50 25 -- lower eng
                    |> filled black
                    |> addOutline (solid 1) (green)
                    |> move (-3,-50)  
                  ,     text "Lower Engine"
                            |> size 8
                            |> filled green
                            |> move(-25, -53)
                  ]
                     |> notifyTap SecurityToLE
            ]
        Electrical  ->
            [rect 400 400
               |> filled black
               
              , rect 60 50
                |> filled blue
                |> addOutline (solid 1) (green)
                |> move (-30, 41.3) 
                
              , rect 6 45
               |> filled blue
               |> addOutline (solid 1) (green)
               |> move(-30, -6.5)   
               
              , rect 85 1
               |> filled green
               |> move(10, -29) 
                
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.016
            |> move (-25, 39)  
            
            , circle 7
              |> filled yellow
              |> move (-38, 30)
              |> notifyTap GoToWires
              
            , text "!"
              |> filled orange
              |> move (-40,26)
              |> notifyTap GoToWires
              
            , text "Electrical"
                  |> filled black
                  |> move(-53,45)
                  
            , group
                  [ rect 40 40 -- storage
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (73, -30)
                   ,    text "Storage"
                            |> size 8
                            |> filled green
                            |> move(60, -30)
                  ]
                     |> notifyTap ElecToStorage
            ]
        Storage  ->
            [ rect 400 400
               |> filled black
               
               , rect 75 1
               |> filled green
               |> move(21, 9)
               
             , ngon 6 30
              |> filled blue
              |> addOutline (solid 1) (green)
              |> move (-20,-37) 
              
              , rect 5 40
                |> filled blue
                |> addOutline (solid 1) (green)
                |> move (-19,9) 
                
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.014
            |> move (-25,-39)      
            
               , text "Storage"
                  |> filled black
                  |> move(-38, -35)
            , group
                  [ ngon 9 45 -- caf
                    |> filled black
                    |> addOutline (solid 1) (green)
                    |> move (-6,73.5) 
                    |> rotate (degrees 10)
                   ,    text "Cafeteria"
                            |> size 8
                            |> filled green
                            |> move(-34, 45)
                  ]
                     |> notifyTap StorageToCaf
            , group
                  [ rect 35 40 -- admin
                      |> filled black
                      |> addOutline (solid 1) (green)
                      |> move (76,9)   
                   ,    text "Admin"
                            |> size 8
                            |> filled green
                            |> move(65, 7)
                  ]
                     |> notifyTap StorageToAdmin
            ]
        Admin  ->
            [rect 400 400
               |> filled black
               
               , rect 78 1
               |> filled green
               |> move(19, -10)
               
               , rect 1 40
               |> filled green
               |> move(-19.5, 9.5) 
                             
              , rect 55 60
                |> filled blue
                |> addOutline (solid 1) (green)
                |> move (58,-10)   
                
            , html 1000 1050 (Html.img [Html.Attributes.src imgsrc] [])
            |> scale 0.015
            |> move (52, -1) 
            
            , circle 7
              |> filled yellow
              |> move (58, -26)
              |> notifyTap GoToCard
              
            , text "!"
              |> filled orange
              |> move (56,-30) 
              |> notifyTap GoToCard
              
            , text "Admin"
                  |> filled black
                  |> move (41 , 5)
                  
            , group
                  [ ngon 9 45 -- caf
                    |> filled black
                    |> addOutline (solid 1) (green)
                    |> move (-6,73.5) 
                    |> rotate (degrees 10)  
                   ,    text "Cafeteria"
                            |> size 8
                            |> filled green
                            |> move(-35, 45)
                  ]
                     |> notifyTap AdminToCaf
            ]

type Msg = Tick Float GetKeyState
         | Tock Float GetKeyState
         | CafToUE 
         | CafToMB 
         | UEtoReactor 
         | UEtoLE 
         | UEtoSecurity 
         | ReactorToLE 
         | ReactorToSecurity 
         | SecurityToReactor 
         | SecurityToLE 
         | LEtoElectrical 
         | LEtoStorage 
         | StorageToCaf 
         | StorageToAdmin 
         | AdminToCaf 
         | MedBayToUE 
         | ElecToStorage
         | GoToLeaf
         | BackFromLeaf
         | LeafMsg Joshin10.Leaf0011.Msg
         | GoToWires
         | BackFromWires
         | WiresMsg Johnsh20.Wires.Msg
         | GoToCard
         | BackFromCard
         | CardMsg Joshin10.Cardswrper1.Msg
         | GoToPasscode
         | BackFromPasscode
         | PasscodeMsg Zhouo2.PasscodeSequence.Msg

type State = Cafeteria 
           | UpperEngine 
           | MedBay 
           | Reactor 
           | LowerEngine 
           | Security 
           | Electrical 
           | Storage 
           | Admin 
           | Leaf
           | Wires
           | Card
           | Passcode
           

update msg model =
    case msg of
        Tick t k ->
            case model.state of
              Leaf ->
                { model | leafModel = Joshin10.Leaf0011.update 
                                      (Joshin10.Leaf0011.Tick (t - model.time) k)
                                      model.leafModel}
              Wires ->
                { model | wiresModel = Johnsh20.Wires.update 
                                      (Johnsh20.Wires.Tick (t - model.time) k)
                                      model.wiresModel}            
              
              Card ->
                { model | cardModel = Joshin10.Cardswrper1.update 
                                      (Joshin10.Cardswrper1.Tick (t - model.time) k)
                                      model.cardModel}
                                    
              Passcode -> 
                { model | passcodeModel = Zhouo2.PasscodeSequence.update
                                          (Zhouo2.PasscodeSequence.Tick (t - model.time) k)
                                          model.passcodeModel}
              otherwise ->
                { model | time = t }
               
        Tock t _ -> if (List.isEmpty model.leafModel.points) 
                   then { init | time = t, lastTime = t } 
                   else { model | time = t}
                
        CafToUE  ->
            case model.state of
                Cafeteria  ->
                    { model | state = UpperEngine  }

                otherwise ->
                    model
        CafToMB  ->
            case model.state of
                Cafeteria  ->
                    { model | state = MedBay  }

                otherwise ->
                    model
        UEtoReactor  ->
            case model.state of
                UpperEngine  ->
                    { model | state = Reactor  }

                otherwise ->
                    model
        UEtoLE  ->
            case model.state of
                UpperEngine  ->
                    { model | state = LowerEngine  }

                otherwise ->
                    model
        UEtoSecurity  ->
            case model.state of
                UpperEngine  ->
                    { model | state = Security  }

                otherwise ->
                    model
        ReactorToLE  ->
            case model.state of
                Reactor  ->
                    { model | state = LowerEngine  }

                otherwise ->
                    model
        ReactorToSecurity  ->
            case model.state of
                Reactor  ->
                    { model | state = Security  }

                otherwise ->
                    model
        SecurityToReactor  ->
            case model.state of
                Security  ->
                    { model | state = Reactor  }

                otherwise ->
                    model
        SecurityToLE  ->
            case model.state of
                Security  ->
                    { model | state = LowerEngine  }

                otherwise ->
                    model
        LEtoElectrical  ->
            case model.state of
                LowerEngine  ->
                    { model | state = Electrical  }

                otherwise ->
                    model
        LEtoStorage  ->
            case model.state of
                LowerEngine  ->
                    { model | state = Storage  }

                otherwise ->
                    model
        StorageToCaf  ->
            case model.state of
                Storage  ->
                    { model | state = Cafeteria  }

                otherwise ->
                    model
        StorageToAdmin  ->
            case model.state of
                Storage  ->
                    { model | state = Admin  }

                otherwise ->
                    model
        AdminToCaf  ->
            case model.state of
                Admin  ->
                    { model | state = Cafeteria  }

                otherwise ->
                    model
        MedBayToUE  ->
            case model.state of
                MedBay  ->
                    { model | state = UpperEngine  }

                otherwise ->
                    model                    
        ElecToStorage  ->
            case model.state of
                Electrical  ->
                    { model | state = Storage  }

                otherwise ->
                    model
        LeafMsg leafMsg ->
             { model | leafModel = Joshin10.Leaf0011.update leafMsg model.leafModel}
             
        GoToLeaf ->
              case model.state of
                  Reactor ->
                    {model | state = Leaf}
                  otherwise ->
                    model
        BackFromLeaf ->
              case model.state of
                  Leaf ->
                    {model | state = Reactor, leafModel = Joshin10.Leaf0011.init}
                  otherwise ->
                    model
        WiresMsg wiresMsg ->
             { model | wiresModel = Johnsh20.Wires.update wiresMsg model.wiresModel}
             
        GoToWires ->
              case model.state of
                  Electrical ->
                    {model | state = Wires}
                  otherwise ->
                    model
        BackFromWires ->
              case model.state of
                  Wires ->
                    {model | state = Electrical, wiresModel = Johnsh20.Wires.init}
                  otherwise ->
                    model
        CardMsg cardMsg ->
             { model | cardModel = Joshin10.Cardswrper1.update cardMsg model.cardModel}
             
        GoToCard ->
              case model.state of
                  Admin ->
                    {model | state = Card}
                  otherwise ->
                    model
        BackFromCard ->
              case model.state of
                  Card ->
                    {model | state = Admin, cardModel = Joshin10.Cardswrper1.init }
                  otherwise ->
                    model
        PasscodeMsg passcodeMsg ->
          { model | passcodeModel = Zhouo2.PasscodeSequence.update passcodeMsg model.passcodeModel}
        GoToPasscode ->
          case model.state of
            Security -> 
              { model | state = Passcode }
            otherwise -> 
              model
        BackFromPasscode -> 
          case model.state of
            Passcode -> 
              { model | state = Security, passcodeModel = Zhouo2.PasscodeSequence.init }
            otherwise -> 
              model
        
type alias Model =
    { time : Float
    , state : State
    , leafModel : Joshin10.Leaf0011.Model
    , wiresModel : Johnsh20.Wires.Model
    , cardModel : Joshin10.Cardswrper1.Model
    , passcodeModel : Zhouo2.PasscodeSequence.Model
    , lastTime : Float
    }

type alias Point = (Float, Float)

init : Model
init = { time = 0 
       , lastTime = 0
       , state = Cafeteria 
       , leafModel = Joshin10.Leaf0011.init
       , wiresModel = Johnsh20.Wires.init
       , cardModel = Joshin10.Cardswrper1.init
       , passcodeModel = Zhouo2.PasscodeSequence.init
       }
    
   
main = gameApp Tick { model = init, view = view, update = update, title = "AmongUs" }

view model = collage 192 128 (myShapes model)