A repository to store Magical Creatures.

Defines a `Creature` protocol with the following properties and methods:

```
var name: String { get }
var description: String { get }
var isGood: Bool { get }
var magicPower: Int { get }

func fibonacciAbility(n: Int) -> Int
func ability() -> String  
func interactWith(otherCreature: Creature) -> String
```

`fibonacciAbility(n: Int)` takes parameter `n` and returns the nth element of the Fibonacci sequence.

`ability()` incorporates the `fibonacciAbility(n: Int)` method as well as the `Creature`'s `magicPower` property to describe that `Creature`'s unique magical ability.

`interactWith(otherCreature: Creature)` compares `Creature` and `otherCreature` and returns a String describing an interaction based on the result of a switch statement on both `Creatures`' `isGood` properties.

Defines 3 structs that conform to the `Creature` protocol: `Daemon`, `Spectre` and `Harpy.`

Creates an instance of each of the 3 types of `Creature`'s, with different properties for each individual being.

Defines a `creatureCatalog` array that holds all the `Creature` instances, and a function `describeCreature` that iterates through the array, describing each creature and their interactions with the other creatures in the array.   
