import Data.List

myPlaylist = [ ["BG", "Gery-Nikol", "Kutia pulna s drami"],["BG", "Ogi 23", "pochivka"],["BG", "pochivka", "koleda"], ["Pop", "Niki Minaj", "Anakonutu"],["Chalga", "Azischo", "Lejlej lej"], ["Chalga", "jigi", "Bara bar bum"]]

searchInGenre searchTerm record =
    let genre = record !! 0
    in genre `isInfixOf` searchTerm

searchInArtist searchTerm record =
    let artist = record !! 1
    in artist `isInfixOf` searchTerm

searchInSong searchTerm record =
    let song = record !! 2
    in song `isInfixOf` searchTerm

searchFor "genre" searchTerm playlist =
    [item | item <- playlist, searchInGenre searchTerm item]

searchFor "artist" searchTerm playlist =
    [item | item <- playlist, searchInArtist searchTerm item]

searchFor "song" searchTerm playlist =
    [item | item <- playlist, searchInSong searchTerm item]

searchFor _ searchTerm playlist =
    let
        sF = (\x -> searchFor x searchTerm playlist)
        allResults = map sF ["genre", "artist", "song"]
    in foldr (++) [] allResults

printResults results = do
    print("---- Results ----")
    mapM_ print results
    print("-----------------")

main = do
    printResults( searchFor "genre" "Chalga" myPlaylist)
    printResults( searchFor "artist" "jigi" myPlaylist)
    printResults( searchFor "artist" "Gery-Nikol" myPlaylist)
    printResults( searchFor "song" "pochivka" myPlaylist)
    printResults( searchFor "all" "pochivka" myPlaylist)