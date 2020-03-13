var INF = 999999999

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        
        var paths = [[[Int]]](repeating: [[Int]](), count: n)
        for t in flights {
            paths[t[0]].append([t[1], t[2]])
        }
        var costs = [Int](repeating: INF, count:n)
        search(paths, K, dst, src, 0, 0, &costs)
        
        if costs[dst] == INF {
            return -1
        }
        
        return costs[dst]
    }
}

func search(_ paths:[[[Int]]], _ K: Int, _ dst: Int, _ src: Int, _ cost: Int,_ count: Int, _ costs: inout [Int]) {
    
    if count == K {
        for p in paths[src] {
            if p[0] == dst {
                if costs[dst] > cost + p[1] {
                    costs[dst] = cost + p[1]
                }
                return
            }
        }
        return
    }
    
    for p in paths[src] {
        if p[0] == dst {
            if costs[dst] > p[1] + cost {
                costs[dst] = p[1] + cost
            }
        } else if costs[p[0]] > p[1] + cost {
            costs[p[0]] = p[1] + cost
            search(paths, K, dst, p[0], costs[p[0]], count + 1, &costs)
        }
    }
}
