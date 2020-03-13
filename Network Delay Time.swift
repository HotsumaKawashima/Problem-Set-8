class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var paths = [[[Int]]](repeating: [[Int]](), count: N + 1)

        for t in times {
            paths[t[0]].append([t[1], t[2]])
        }
        
        var INF = 999999999
        
        var costs = [Int](repeating: INF, count: N)
        
        var queue = [[Int]]()
        queue.append([K , 0])
        costs[K - 1] = 0
        
        while queue.count > 0 {
            var t = queue[0]
            queue.removeFirst()
            
            for p in paths[t[0]] {
                if costs[p[0] - 1] > t[1] + p[1] {
                    costs[p[0] - 1] = t[1] + p[1]
                    queue.append([p[0], t[1] + p[1]])
                }
            }
        }

        var result = 0
        for s in costs {
            if s == INF {
                return -1
            } else if result < s {
                result = s
            } 
        }
        
        return result
    }
}
