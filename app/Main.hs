module Main where

import Lib
import Data.Sequence as S
exInd :: (Field Int, S.Seq (S.Seq (S.Seq Int)), S.Seq (S.Seq (S.Seq Int)), Int) -> Int
exInd (_, _, _, i) = i

exField :: (Field Int, S.Seq (S.Seq (S.Seq Int)), S.Seq (S.Seq (S.Seq Int)), Int) -> Field Int
exField (field, _, _, _) = field

exPos :: (Field Int, S.Seq (S.Seq (S.Seq Int)), S.Seq (S.Seq (S.Seq Int)), Int) -> S.Seq (S.Seq (S.Seq Int))
exPos (_, sp, _, _) = sp

exBoard :: (Field Int, S.Seq (S.Seq (S.Seq Int)), S.Seq (S.Seq (S.Seq Int)), Int) -> S.Seq (S.Seq (S.Seq Int))
exBoard (_, _, b, _) = b

-- main :: IO (Field Int, [[[Int]]], [[[Int]]], Int)
main :: IO (Int)
main = do -- все работает заебись

    -- prs <- getLine
    --unparse into [[]]
    let v = [[],[],[15],[20],[25],[28],[31],[34],[36],[38],[40],[42],[44],[44],[46],[46],[47],[47],[19,25],[16,20],[14,20],[13,18],[13,17],[13,16],[12,15],[12,15],[12,14],[12,13],[12,13],[12,12],[13,13],[13,13],[15,13],[20,13],[22,13],[14,3,13],[11,2,13],[10,8,20],[10,3,6,22],[10,6,1,4,17],[9,6,3,14],[9,2,5,13],[9,2,3,3,12],[9,1,9,12],[9,1,5,12],[9,2,12],[9,2,13],[9,1,13],[9,1,13],[8,1,14],[8,1,14],[8,2,2,14],[8,2,2,14],[8,1,1,15],[7,3,3,15],[6,2,2,15],[5,4,16],[5,16],[5,17],[5,5,3,17],[5,6,6,18],[5,6,6,18],[6,11,19],[6,9,19],[5,5,20],[4,21],[5,22],[6,2,23],[8,2,24],[9,2,25],[10,2,26],[11,2,27],[10,2,28],[9,4,30],[9,37],[9,29],[9,30],[9,31],[9,32],[9,33]]
    let pv = toL v
    let h = [[8],[9],[9],[17,10],[25,10],[30,11],[36,12],[41,12],[46,13],[50,6],[53,5],[43,13],[30,10],[28,8],[28,3],[29,2],[29,1,2],[20,3,2,2],[18,2,3,2],[18,2,1,2,2],[17,2,4,1,2],[16,2,4,2,2],[17,2,4,3,1],[17,2,4,4,2],[16,2,2,1,5,2],[17,2,2,3,4,1],[17,1,2,1,5,1],[16,1,2,4,1,1],[16,2,3,1,2],[16,1,4,1,3],[16,1,5,2,4],[17,2,4,7],[17,7,2,4,8],[17,5,2,1,3,9],[17,2,3,3,10],[17,2,2,11],[17,1,1,12],[18,2,1,13],[19,2,2,14],[19,2,4,15],[19,3,4,16],[20,2,1,2,18],[20,2,4,20],[21,3,4,22],[22,3,2,24],[22,3,1,27],[24,4,31],[36,34],[73],[72],[71],[70],[69],[68],[66],[64],[61],[60],[55],[50]]
    let ph = toL h
    -- print pv
    let mainField = Field  {rows = 0, columns = 0, hor = ph, ver = pv, clauses = S.empty} --unparse [[]]
    let curField = mainField
    let mainField = rebuildFieldVer curField
    let rowsField = rows mainField
    let columnsField = columns mainField 
    let sizeR = rowsField * columnsField
    let maxk = maxRCField mainField
    let layers = layersField sizeR maxk
    -- print mainField
    let board = boardField sizeR
    -- print board
    let startPos = startPosField sizeR
    -- print mainField
    -- -- print startPos
    -- -- print layers
    -- -- print sizeR
    newF <- func1 mainField 1 layers sizeR startPos 0 board 
    let ind = exInd newF
    let mainField = exField newF
    let startPos = exPos newF
    let board = exBoard newF
    -- print startPos
    -- print ind
    -- print mainField
    print $ S.length $ clauses mainField
    -- print board
    newF <- func1 mainField 0 layers sizeR startPos ind board 
    let ind = exInd newF
    let mainField = exField newF
    let startPos = exPos newF
    let board = exBoard newF
    -- -- print ind
    -- print $ S.length $ clauses mainField
    -- -- print startPos
    -- -- print board
    -- -- print mainField
    newF <- func2 mainField board
    let mainField = newF
    -- print $ S.length $ clauses mainField
    -- -- print mainField
    newF <- func3 mainField sizeR startPos board
    let mainField = newF
    print $ S.length $ clauses mainField
    -- print mainField
    return ind