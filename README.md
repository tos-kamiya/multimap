# MultiMapWrapper, a muti-map for Haskell

A module MutiMapWrapper is a thin wapper 
in order to use a Data.Map as a multi-map.

A multi-map consists of a map, which has mutiplue values (as a list)
for each key.

```
   >>> import qualified Data.Map as M
   
   >>> let a = [(2, 2), (3, 3), (2, 4), (5, 5), (2, 6)]
   >>> let m = M.fromList a
   >>> m
   fromList [(2,6),(3,3),(5,5)]
   >>> :type m
   m :: M.Map Integer Integer
   >>> M.lookup 2 m
   Just 6
   
   >>> :load MultiMapWrapper
   >>> let a = [(2, 2), (3, 3), (2, 4), (5, 5), (2, 6)]
   >>> let mm = fromList a
   >>> mm
   fromList [(2,[2,4,6]),(3,[3]),(5,[5])]
   >>> :type mm
   mm :: M.Map Integer [Integer]
   >>> lookupList 2 mm
   [2,4,6]
   >>> lookupList 999 mm
   []
   >>> M.lookup 2 mm
   Just [2,4,6]
   >>> M.lookup 999 mm
   Nothing
```

## Functions

* fromList :: Ord k => [(k, v)] -> Map k [v]

Builds a multi-map from a list of (key, value) pairs.
The return value is a map from a key to multiple values.

* toList :: Ord k=> Map k [v] => [(k, v)]

Reverts a multi-map to a list of (key, value) pairs.

* lookupList :: Ord k => Map k [v] => [v]

A look-up function, which returns a list, not a Maybe.

## License

Public Domain.
   
