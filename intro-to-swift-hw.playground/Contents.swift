import UIKit

// 1
protocol Creature {
  var name: String { get }
  var description: String { get }
  var isGood: Bool { get }
  var magicPower: Int { get }
  
  // 2
  func fibonacciAbility(n: Int) -> Int
  func ability() -> String
  
  // 4
  func interactWith(otherCreature: Creature) -> String
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
    "\(name) puts on a dazzling display of shapeshifting prowess, shifting between \(fibonacciAbility(n: magicPower)) different animal forms in the span of only 20 seconds."
  }
  
  // 4
  func interactWith(otherCreature: any Creature) -> String {
    switch (isGood, otherCreature.isGood) {
    case (true, true):
      "\(name) shifts into an ermine and approachs  \(otherCreature.name) to sniff them. Having determined that \(otherCreature.name) means no harm, \(name) invites \(otherCreature.name) to explore the nearby forest together."
    case (true, false):
      "\(name) rears back and transforms into a mighty dragon, jumping in front of its person and spreading its wings wide in a protective shield while baring its fangs at \(otherCreature.name)."
    case (false, true):
      "\(name) looks \(otherCreature.name) up and down, assessing the best way he can take advantage of this foolish creature and their dull person."
    case (false, false):
      "\(name) gives \(otherCreature.name) a knowing smile and invites them to join them in finding some unfortunate humans to torment."
    }
  }
}

// 1
struct Spectre: Creature {
  var name: String
  var description: String
  var isGood: Bool = false
  var magicPower: Int
  
  // 2
  func ability() -> String {
    "\(name) wordlessly calls \(fibonacciAbility(n: magicPower)) of its shadowy brethren to join in its deathly hunt."
  }
  
  // 4
  func interactWith(otherCreature: any Creature) -> String {
    switch (isGood, otherCreature.isGood) {
    case (true, true):
      "\(name) takes stock of their life and realizes that they no longer want to drain the essence from other living creatures. They allow \(otherCreature.name) to pass safely by."
    case (true, false):
      "\(name) takes one look at \(otherCreature.name)'s wretchedness and decides to make an exception to its 'no life-draining' policy. It silently and relentlessly decends upon \(otherCreature.name)."
    case (false, true):
      "\(name) descends upon \(otherCreature.name) without mercy, calling upon its shadowy friends to join in on the feast."
    case (false, false):
      "If \(name) had a face, it would give \(otherCreature.name) a knowing smile as it chases down the poor creatures that \(otherCreature) wasn't able to capture itself."
    }
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
  
  // 4
  func interactWith(otherCreature: any Creature) -> String {
    switch (isGood, otherCreature.isGood) {
    case (true, true):
      "\(name) patiently listens to \(otherCreature.name)'s story and determines that they have told the full truth. \(name) offers to guide \(otherCreature.name) out of the underworld to release their soul."
    case (true, false):
      "\(name) senses dishonesty and manipulation in \(otherCreature.name)'s story and lets out an ear-piercing screech, beating her wings and grasping at \(otherCreature.name) with her claws. She lifts \(otherCreature.name) high up into the air and drops them into the abyss."
    case (false, true):
      "\(name) tires of listening to other creatures' stories, honest or not. She seizes \(otherCreature.name) and carries them away, never to be seen again."
    case (false, false):
      "\(name) senses in \(otherCreature.name) a similar cynicism at the ubiquitousness of human falsehood, and invites them to join them in making the underworld humans' immortal souls miserable for all of eternity."
    }
  }
}

// 1
let pantalaimon = Daemon(
  name: "Pantalaimon",
  description: "A shapeshifting creature that is bonded to a person and represents their soul and conscience.",
  isGood: true,
  magicPower: 6
)

// 1
let wraith = Spectre(
  name: "Wraith",
  description: "A shadowy creature that is created when doors between universes are opened. Only visible to fully-mature individuals, their touch can drain the life out of any creature that can see them.",
  isGood: false,
  magicPower: 8
)

// 1
let noName = Harpy(name: "Gracious Wings", description: "A hideous flying creature that resembles a giant eagle with a human face of unimaginable age. Lives in the Land of the Dead and feeds on dishonesty and suffering, but also is willing to trade safe passage through the underworld for honest life stories.", isGood: true, magicPower: 10
)

// 3
var creatureCatalog: [Creature] = [pantalaimon, wraith, noName]

func describeCreature(creatureCatalog: [Creature]) {
  for creature in creatureCatalog {
    var alignment = creature.isGood ? "Good" : "Evil"
    
    print("Name: \(creature.name)")
    print("Alignment: \(alignment)\n")
    print("Description:\n\t\(creature.description)\n")
    print("Special ability:\n\t\(creature.ability())\n")
    
    // 4
    print("Interactions:")
    let otherCreatures = creatureCatalog.filter { $0.name != creature.name }
    
    for otherCreature in otherCreatures {
      print("\n\(creature.name) and \(otherCreature.name):\n\t \(creature.interactWith(otherCreature: otherCreature))")
    }
    
    print("--------")
  }
}

// 4
describeCreature(creatureCatalog: creatureCatalog)
