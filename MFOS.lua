print("start up system: y\nthis is a open source project started by MFworks")
local start = io.read()
if start == "y" then
  --screens--
  local hud = {
    main = {
      output = [[
      |######################################################################|
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |______________________________________________________________________|
      |[o]   [file explorer]  [notes]  [coin clicker]  [CSGO-caseclicker]    |
      |######################################################################|
      ]]
    },
    file_explorer = {
      output = [[
      |######################################################################|
      |file explorer                                                         |
      |======================================================================|
      |downloads  |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |######################################################################|
      ]]
    },
    note_app = {
      output = [[
      |######################################################################|
      |notes                                                                 |
      |======================================================================|
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |######################################################################|
      ]]
    },
    file_explorer_downloads = {
      output = [[
      |######################################################################|
      |file explorer > downloads                                             |
      |======================================================================|
      |downloads  |note_app.dow                                              |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |           |                                                          |
      |######################################################################|
      ]]
    },
    coin_clicker_game = {
      output = [[
      |######################################################################|
      |coin clicker                                                          |
      |======================================================================|
      |press enter to start the game!                                        |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |######################################################################|
      ]]
    },
    explorer_tab = {
      output = [[
      |######################################################################|
      |                                                                      |
      | _____________________________________________                        |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||                                             |                       |
      ||_____________________________________________|                       |
      |______________________________________________________________________|
      |[o]   [file explorer]  [notes]  [coin clicker]  [CSGO-caseclicker]    |
      |######################################################################|
      ]]
    },
    CSGO = {
      output = [[
      press enter to open CSGO case opener
      ]]
    }
  }

  local coin_game = {
    main_game = {
      output = [[
      |######################################################################|
      |coin clicker                                                          |
      |======================================================================|
      |press enter to click!                                                 |
      |type 's' then enter to open shop!                                     |
      |* note this is beta phase!                                            |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |                                                                      |
      |######################################################################|
      ]]
    },
    coin_shop = {
      output = [[
      1. +1 clicks: costs 10
      2. +2 clicks: costs 100
      3. +4 clicks: costs 1500
      4. 1.5x clicks: costs 3000
      press space then enter to return!
      ]]
    },
  }

  local function showcoin(coin)
    os.execute("clear")
    print(coin_game[coin].output)
  end

  local upgrades = {
    upgrade1 = 1,
    upgrade2 = 2,
    upgrade3 = 4,
    upgrade4 = 1.5
  }

  local stats = {
    coins = 0,
    coinsperclick = 1
  }

  local stats1 = {
    cash = 0,
    cashperclick = 0.5,
    cases = 0,
    invValue = 0
  }

  local items = {}

  local weapons = {
    knife = 0,
    ak47 = 0,
    FAL = 0,
  }
  local weaponsvalue = {
    knife = 5,
    ak47 = 15,
    FAL = 20
  }
  local function getValue()
    return weapons.knife * weaponsvalue.knife + weapons.ak47 * weaponsvalue.ak47 + weapons.FAL * weaponsvalue.FAL
  end

  local cases = {
    case1 = {
      cost = 5,
    },
    case2 = {
      cost = 10,
    },
    case3 = {
      cost = 100
    },
    case4 = {
      cost = 1500
    }
  }

  local casetypes = {
    commoncase = 0,
    uncommoncase = 0,
    rarecase = 0,
    legendarycase = 0,
  }

  local upgrades1 = {
    upgrade1 = {
      effect = 1,
      cost = 10
    },
    upgrade2 = {
      effect = 1.5,
      cost = 100
    },
    upgrade3 = {
      effect = 1.6,
      cost = 1500
    }
  }

  local ui = {
    main = {
      output = [[
      csgo text-based case opener
      "s": shop
      "u": upgrades
      "i": inventory
      "c": case inventory
      "w": sell items
      ]]
    },
    shop = {
      output = [[
      shop:
      1. common case:    cost 5
      2. uncommon case:  cost 10
      3. rare case:      cost 100
      4. legendary case: cost 1500
      ]]
    },
    upgrades = {
      output = [[
      upgrades:
      1. +1 cash per click:   cost 10
      2. 1.5x cash per click: cost 100
      3. 1.6x cash per click: cost 1500
      ]]
    },
    caseinventory = {
      output = [[
      press enter to open [case inventory]
      ]]
    },
    sellitems = {
      output = [[
      press enter to open [sell items]
      ]]
    },
    inventory = {
      output = [[
      press enter to open [inventory]
      ]]
    }
  }
  local function clear()
    os.execute("clear")
  end

  local function wait(number)
    os.execute("sleep " .. number)
  end

  local function showui(name)
    os.execute("clear")
    print(ui[name].output)
  end

  local currentui = "main"

  local function showhud(screen) --function that sets showhud(currentscreen)
    os.execute("clear")
    print(hud[screen].output)
  end

  local currentscreen = "main" --sets current screen too "main"
  local currentgame = "main_game"

  --event handler--
  while true do
    showhud(currentscreen)
    local input = string.lower(io.read())
    if currentscreen == "main" then
      if input == "f" then
        currentscreen = "file_explorer"
      end
      if input == "n" then
        currentscreen = "note_app"
      end
      if input == "c" then
        currentscreen = "coin_clicker_game"
      end
      if input == "o" then
        currentscreen = "explorer_tab"
      end
      if input == "cs" then
        currentscreen = "CSGO"
      end
    elseif currentscreen == "CSGO" then
      if input == " " then
        currentscreen = "main"
      end
      while currentscreen == "CSGO" do
        showui(currentui)
        print("cash: " .. stats1.cash)
        print("value: " .. getValue())
        print("cash per click: " .. stats1.cashperclick)
        local input = io.read()


        if currentui == "main" then
          if input == "" then
            stats1.cash = stats1.cash + stats1.cashperclick
          end
          if input == "s" then
            currentui = "shop"
          end
          if input == "i" then
            currentui = "inventory"
          end
          if input == "c" then
            currentui = "caseinventory"
          end
          if input == "u" then
            currentui = "upgrades"
          end
          if input == "w" then
            currentui = "sellitems"
          end
          if input == " " then
            currentscreen = "main"
          end
        elseif currentui == "inventory" then
          while currentui == "inventory" do
            os.execute("clear")
            print("knifes: " .. weapons.knife)
            print("ak47's: " .. weapons.ak47)
            print("FAL's: " .. weapons.FAL)
            local input1 = io.read()

            if input1 == " " then
              currentui = "main"
            end
          end
        elseif currentui == "sellitems" then
          if input == " " then
            currentui = "main"
          end
          while currentui == "sellitems" do
            os.execute("clear")
            print("items:")
            print("1. knifes: " .. weapons.knife)
            print("2. ak47's: " .. weapons.ak47)
            print("3. FAL's: " .. weapons.FAL)
            print("cash: " .. stats1.cash)
            print("value: " .. getValue())
            local input1 = io.read()
            if input1 == "1" and weapons.knife >= 1 then
              weapons.knife = weapons.knife - 1
              stats1.cash = stats1.cash + weaponsvalue.knife
            end
            if input1 == "2" and weapons.ak47 >= 1 then
              weapons.ak47 = weapons.ak47 - 1
              stats1.cash = stats1.cash + weaponsvalue.ak47
            end
            if input1 == "3" and weapons.FAL >= 1 then
              weapons.FAL = weapons.FAL - 1
              stats1.cash = stats1.cash + weaponsvalue.FAL
            end
            if input1 == " " then
              currentui = "main"
            end
          end
        elseif currentui == "upgrades" then
          if input == " " then
            currentui = "main"
          end
          if input == "1" and stats1.cash >= upgrades1.upgrade1.cost then
            stats1.cash = stats1.cash - upgrades1.upgrade1.cost
            stats1.cashperclick = stats1.cashperclick + upgrades1.upgrade1.effect
          end
          if input == "2" and stats1.cash >= upgrades1.upgrade2.cost then
            stats1.cash = stats1.cash - upgrades1.upgrade2.cost
            stats1.cashperclick = stats1.cashperclick + upgrades1.upgrade2.effect
          end
          if input == "3" and stats1.cash >= upgrades1.upgrade3.cost then
            stats1.cash = stats1.cash - upgrades1.upgrade3.cost
            stats1.cashperclick = stats1.cashperclick + upgrades1.upgrade3.effect
          end
        elseif currentui == "shop" then
          if input == " " then
            currentui = "main"
          end
          if input == "1" and stats1.cash >= cases.case1.cost then
            stats1.cash = stats1.cash - cases.case1.cost
            casetypes.commoncase = casetypes.commoncase + 1
          end
          if input == "2" and stats1.cash >= cases.case2.cost then
            stats1.cash = stats1.cash - cases.case2.cost
            casetypes.uncommoncase = casetypes.uncommoncase + 1
          end
          if input == "3" and stats1.cash >= cases.case3.cost then
            stats1.cash = stats1.cash - cases.case3.cost
            casetypes.rarecase = casetypes.rarecase + 1
          end
          if input == "4" and stats1.cash >= cases.case4.cost then
            stats1.cash = stats1.cash - cases.case4.cost
            casetypes.legendarycase = casetypes.legendarycase + 1
          end
        elseif currentui == "caseinventory" then
          if input == " " then
            currentui = "main"
          end
          while currentui == "caseinventory" do
            os.execute("clear")
            print("case inventory:")
            print("1. common cases: " .. casetypes.commoncase)
            print("2. uncommon cases: " .. casetypes.uncommoncase)
            print("3. rare cases: " .. casetypes.rarecase)
            print("4. legendary cases: " .. casetypes.legendarycase)
            local input1 = io.read()
            if input1 == " " then
              currentui = "main"
            end
            if input1 == "1" and casetypes.commoncase >= 1 then
              casetypes.commoncase = casetypes.commoncase - 1
              local r = math.random()
              if r <= 0.7 then
                table.insert(items, "knife")
                weapons.knife = weapons.knife + 1
                print("you got knife")
                os.execute("sleep 1")
              elseif r >= 0.8 then
                table.insert(items, "ak47")
                weapons.ak47 = weapons.ak47 + 1
                print("you got ak47")
                os.execute("sleep 1")
              else
                table.insert(items, "FAL")
                weapons.FAL = weapons.FAL + 1
                print("you got FAL")
                os.execute("sleep 1")
              end
            end
            if input1 == "2" and casetypes.uncommoncase >= 1 then
              casetypes.uncommoncase = casetypes.uncommoncase - 1
              local r = math.random()
              if r <= 0.6 then
                table.insert(items, "knife")
                weapons.knife = weapons.knife + 1
                print("you got knife")
                os.execute("sleep 1")
              elseif r >= 0.7 then
                table.insert(items, "ak47")
                weapons.ak47 = weapons.ak47 + 1
                print("you got ak47")
                os.execute("sleep 1")
              else
                table.insert(items, "FAL")
                weapons.FAL = weapons.FAL + 1
                print("you got FAL")
                os.execute("sleep 1")
              end
            end
            if input1 == "3" and casetypes.rarecase >= 1 then
              casetypes.rarecase = casetypes.rarecase - 1
              local r = math.random()
              if r <= 0.4 then
                table.insert(items, "knife")
                weapons.knife = weapons.knife + 1
                print("you got knife")
                os.execute("sleep 1")
              elseif r >= 0.5 then
                table.insert(items, "ak47")
                weapons.ak47 = weapons.ak47 + 1
                print("you got ak47")
                os.execute("sleep 1")
              else
                table.insert(items, "FAL")
                weapons.FAL = weapons.FAL + 1
                print("you got FAL")
                os.execute("sleep 1")
              end
            end
            if input1 == "4" and casetypes.legendarycase >= 1 then
              casetypes.legendarycase = casetypes.legendarycase - 1
              local r = math.random()
              if r <= 0.2 then
                table.insert(items, "knife")
                weapons.knife = weapons.knife + 1
                print("you got knife")
                os.execute("sleep 1")
              elseif r >= 0.3 then
                table.insert(items, "ak47")
                weapons.ak47 = weapons.ak47 + 1
                print("you got ak47")
                os.execute("sleep 1")
              else
                table.insert(items, "FAL")
                weapons.FAL = weapons.FAL + 1
                print("you got FAL")
                os.execute("sleep 1")
              end
            end
          end
        end
      end
    elseif currentscreen == "file_explorer" then
      if input == "d" then
        currentscreen = "file_explorer_downloads"
      end
      if input == " " then
        currentscreen = "main"
      end
    elseif currentscreen == "file_explorer_downloads" then
      if input == " " then
        currentscreen = "file_explorer"
      end
    elseif currentscreen == "explorer_tab" then
      if input == " " then
        currentscreen = "main"
      end
      if input == "f" then
        currentscreen = "file_explorer"
      end
      if input == "n" then
        currentscreen = "note_app"
      end
      if input == "c" then
        currentscreen = "coin_clicker_game"
      end
      if input == "cs" then
        currentscreen = "CSGO"
      end
    elseif currentscreen == "note_app" then
      if input == " " then
        currentscreen = "main"
      end
    elseif currentscreen == "coin_clicker_game" then
      if input == " " then
        currentscreen = "main"
      end
      while currentscreen == "coin_clicker_game" do
        showcoin(currentgame)
        print("coins: " .. stats.coins)
        print("coins per click: " .. stats.coinsperclick)
        local input = io.read()
        if currentgame == "main_game" then
          if input == "" then
            stats.coins = stats.coins + stats.coinsperclick
          end
          if input == " " then
            currentscreen = "main"
          end
          if input == "s" then
            currentgame = "coin_shop"
          end
        elseif currentgame == "coin_shop" then
          if input == "1" and stats.coins >= 10 then
            stats.coins = stats.coins - 10
            stats.coinsperclick = stats.coinsperclick + upgrades.upgrade1
          end
          if input == "2" and stats.coins >= 100 then
            stats.coins = stats.coins - 100
            stats.coinsperclick = stats.coinsperclick + upgrades.upgrade2
          end
          if input == "3" and stats.coins >= 1500 then
            stats.coins = stats.coins - 1500
            stats.coinsperclick = stats.coinsperclick + upgrades.upgrade3
          end
          if input == "4" and stats.coins >= 3000 then
            stats.coins = stats.coins - 3000
            stats.coinsperclick = stats.coinsperclick * upgrades.upgrade4
          end
          if input == " " then
            currentgame = "main_game"
          end
        end
      end
    end
  end
end