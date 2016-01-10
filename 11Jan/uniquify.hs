import Data.List

addIndexes [] _ _ = []
addIndexes list [] _ = list
addIndexes (firstItem:leftItems) (firstIndex:leftIndexes) indexingElement
    | firstItem == indexingElement && firstIndex == 0 = firstItem : addIndexes leftItems leftIndexes indexingElement
    | firstItem == indexingElement = (firstItem++"-"++ show firstIndex) : addIndexes leftItems leftIndexes indexingElement
    | otherwise =  firstItem : addIndexes leftItems (firstIndex:leftIndexes) indexingElement


loopElements list [] result = result
loopElements list (uniqueH:uniqueT) result =
    let allUniqueH = filter (==uniqueH) list
        uniqueCount = length allUniqueH
        uniqueRange = [0..uniqueCount - 1]
        indexedResult = addIndexes result uniqueRange uniqueH
    in loopElements list uniqueT indexedResult

uniquify list =
    let unique = nub list
    in
        loopElements list unique list
main = do
    print( uniquify ["a","c", "a", "b", "c", "b", "a"])