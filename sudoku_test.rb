class SudokuTest
  N = 9

  def solveSuduko(grid, row, col)
    if (row == N-1 && col == N)
      return true
    end

    if col == N
      row += 1
      col = 0
    end
    if grid[row][col] > 0
      return solveSuduko(grid, row, col+1)
    end

    for num in 1..N
      if isSafe(grid, row, col, num)
        grid[row][col] = num

        if solveSuduko(grid, row, col + 1)
          return true
        end
      end
    end
    grid[row][col] = 0
    return false
  end

  def isSafe(grid, row, col, num)
    for x in 0...9
      if grid[row][x] == num
        return false
      end
    end
    for x in 0...9
      if grid[x][col] == num
        return false
      end
    end

    startRow = row - row % 3
    startCol = col - col % 3

    for i in 0...3
      for j in 0...3
        if grid[i + startRow][j + startCol] == num
          return false
        end
      end
    end

    return true
  end

  def printing(arr)
    for i in 0...N
      for j in 0...N
        print arr[i][j]
        print ' ' unless j == N - 1
      end
      puts
    end
  end
end
grid = [[3, 0, 6, 5, 0, 8, 4, 0, 0],
        [5, 2, 0, 0, 0, 0, 0, 0, 0],
        [0, 8, 7, 0, 0, 0, 0, 3, 1],
        [0, 0, 3, 0, 1, 0, 0, 8, 0],
        [9, 0, 0, 8, 6, 3, 0, 0, 5],
        [0, 5, 0, 0, 9, 0, 6, 0, 0],
        [1, 3, 0, 0, 0, 0, 2, 5, 0],
        [0, 0, 0, 0, 0, 0, 0, 7, 4],
        [0, 0, 5, 2, 0, 6, 3, 0, 0]]

sudoku = SudokuTest.new
if sudoku.solveSuduko(grid, 0, 0)
  sudoku.printing(grid)
else
  print("no solution  exists ")
end