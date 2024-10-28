import UIKit

// 1
protocol Creature {
  var name: String { get }
  var description: String { get }
  var isGood: Bool { get }
  var magicPower: Int { get }
  
  func fibonacciAbility(n: Int) -> Int
  func ability() -> String // 2
}

// 2
extension Creature {
  func fibonacciAbility(n: Int) -> Int {
    var fibonacciSeries: [Int] = []
    
    for index in 0...n {
      if index < 2 {
        fibonacciSeries.append(index)
      } else {
        let element1 = fibonacciSeries[fibonacciSeries.count - 1]
        let element2 = fibonacciSeries[fibonacciSeries.count - 2]
        fibonacciSeries.append(element1 + element2)
      }
    }
    
    return fibonacciSeries[n]
  }
}

// 1
struct Daemon: Creature {
  let name: String
  let description: String
  let isGood: Bool
  let magicPower: Int
  
  // 2
  func ability() -> String {
    "\(name) puts on a dazzling display of shapeshifting prowess, shifting between \(fibonacciAbility(n: magicPower)) different animal forms in the span of only 30 seconds."
  }
}

// 1
struct Spectre: Creature {
  var name: String
  var description: String
  var isGood: Bool
  var magicPower: Int
  
  // 2
  func ability() -> String {
    "\(name) wordlessly calls \(fibonacciAbility(n: magicPower)) of its shadowy brethren to join in its deathly hunt"
  }
}

// 1
struct Harpy: Creature {
  var name: String
  var description: String
  var isGood: Bool
  var magicPower: Int
  
  // 2
  func ability() -> String {
    "\(name) flys \(fibonacciAbility(n: magicPower)) feet into the air and then dives at a fearsome speed towards her next quarry, ready to rend with her claws if she senses a hint of dishonesty in their story."
  }
}

// 1
let pantalaimon = Daemon(
  name: "Pantalaimon",
  description: "A shapeshifting creature that is bonded to a person and represents their soul.",
  isGood: true,
  magicPower: 3
)

// 1
let wraith = Spectre(
  name: "Wraith",
  description: "A shadowy creature that is created when doors between universes are opened. Only visible to fully-mature individuals, their touch can drain the life out of any creature that can see them.",
  isGood: false,
  magicPower: 8
)

// 1
let noName = Harpy(name: "Gracious Wings", description: "A hideous flying creature that resembles a giant eagle with a human face of unimaginable age. Lives in the Land of the Dead and feeds on dishonesty and suffering, but also is willing to trade safe passage through the underworld for honest life stories.", isGood: true, magicPower: 6
)


