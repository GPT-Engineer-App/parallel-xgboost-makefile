# Compiler
CXX = g++
CXXFLAGS = -std=c++11 -pthread

# Nom du fichier source et de l'exécutable
SRC = XGBoost_Parallele.cpp
EXEC = XGBoost_Parallele

# Cible par défaut
all: $(EXEC)

# Règle pour créer l'exécutable
$(EXEC): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(EXEC) $(SRC)

# Cible pour nettoyer les fichiers générés
clean:
	rm -f $(EXEC) train_loss.txt train_loss.plt train_loss.png

# Cible pour exécuter le programme
run: $(EXEC)
	./$(EXEC)

# Cible pour visualiser la perte d'entraînement
plot: train_loss.txt
	gnuplot -e "set terminal png; set output 'train_loss.png'; set title 'Training Loss'; set xlabel 'Iteration'; set ylabel 'Loss'; plot 'train_loss.txt' with lines"

.PHONY: all clean run plot