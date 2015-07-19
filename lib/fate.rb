def alive_but_lonely(cell)
  cell.current_state == 1 && cell.living_neighbors <= 1
end

def alive_and_kicking(cell)
  cell.current_state == 1 && (cell.living_neighbors == 2 || cell.living_neighbors == 3)
end

def alive_but_starving(cell)
  cell.current_state == 1 && cell.living_neighbors > 3
end

def born_again(cell)
  cell.current_state = 0 && cell.living_neighbors == 3
end

def staying_dead(cell)
  cell.current_state == 0 && cell.living_neighbors != 3
end

def decide_fate(cell)
  if alive_but_lonely(cell)
    puts "alive_but_lonely -----#{[cell.y, cell.x]}---------------- i have #{cell.living_neighbors} neighbors ---"
    cell.future_state = 0
  elsif  alive_and_kicking(cell)
    puts "alive_and_kicking ----#{[cell.y, cell.x]}-----------------i have #{cell.living_neighbors} neighbors ---"
    cell.future_state = 1
  elsif alive_but_starving(cell)
    puts "alive_but_starving ---#{[cell.y, cell.x]}---------------- i have #{cell.living_neighbors} neighbors ---"
    cell.future_state = 0
  elsif born_again(cell)
   puts "born_again -----------#{[cell.y, cell.x]}---------------- i have #{cell.living_neighbors} neighbors ---"
    cell.future_state = 1
  elsif staying_dead(cell)
    puts "still_dead -----------#{[cell.y, cell.x]}---------------- i have #{cell.living_neighbors} neighbors ---"
    cell.future_state = 0
  end
end

def tick_tock
  @board.each do |cell|
    cell.current_state = cell.future_state
  end
end

def change_colors(cell)
  if cell.alive?(cell)
    fill 256, 0, 0
    rect cell.x * 5, cell.y * 5, 5, 5
  else
    fill 0, 0, 0
    rect cell.x * 5, cell.y * 5, 5, 5
  end
end
