module AdventDaySeven where

concatenate :: Integer -> Integer -> Integer
concatenate a b = read $ (show a) ++ (show b)

operators = [(+), (*), concatenate]

equation testValue [acc] = testValue == acc
equation testValue (acc:x:xs) = testValue >= acc &&
    any (\op -> equation testValue ((acc `op` x):xs)) operators

filterEquations = filter (\(testValue:numbers) -> equation testValue numbers)
getTestValue (testValue:_) = testValue

totalCalibrationResult = sum . (map getTestValue) . filterEquations 

-- s/:* /, /g
-- s/^/    [/
-- s/$/],/
-- $s/,$/]/
exampleInput = [
    [190, 10, 19],
    [3267, 81, 40, 27],
    [83, 17, 5],
    [156, 15, 6],
    [7290, 6, 8, 6, 15],
    [161011, 16, 10, 13],
    [192, 17, 8, 14],
    [21037, 9, 7, 18, 13],
    [292, 11, 6, 16, 20]]
