module MultiMapWrapper where

import Data.List
import qualified Data.Map as M

fromList :: Ord k => [(k, v)] -> M.Map k [v]
fromList items =
  M.fromList . map (\is -> (fst . head $ is, map snd is))
  . groupBy (\i j -> fst i == fst j)
  . sortBy (\i j -> fst i `compare` fst j) $ items

toList :: Ord k => M.Map k [v] -> [(k, v)]
toList mm =
  concat . map (\(k, vs) -> [(k, v) | v <- vs]) . M.toList $ mm

lookupList :: Ord k => k -> M.Map k [v] -> [v]
lookupList key mm = case M.lookup key mm of
  Just vs -> vs
  Nothing -> []

