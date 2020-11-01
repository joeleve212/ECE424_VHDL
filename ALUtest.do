force -freeze /A X"00000001" 0
force -freeze /B X"FFFFFFFF" 0

force -freeze /A X"0000FFFF" 100
force -freeze /B X"FFFF0000" 100

force -freeze /A X"7FFFFFFF" 200
force -freeze /B X"7FFFFFFF" 200

force -freeze /A X"F000FFFF" 300
force -freeze /B X"7000FFFF" 300

force -freeze /A X"A0A0A1A1" 400
force -freeze /B X"7151B17B" 400

force -freeze /ALUOp "1100" 0

run 500
