# Ball Drag Game - Jogo de Arrastar a Bola

## 📖 Descrição

Um jogo simples e divertido feito em GDScript/Godot onde o jogador precisa arrastar uma bola até acertar um alvo.

## 🎮 Como Jogar

1. **Clique** na bola azul no centro da tela
2. **Arraste** a bola em direção ao alvo vermelho
3. A bola se move **suavemente**, simulando um arrasto realista
4. Quando acertar o alvo, uma mensagem de parabéns será exibida
5. Clique em "Jogar Novamente" para resetar o jogo

## 🚀 Como Executar

### Requisitos
- Godot Engine 4.2 ou superior

### Passos
1. Clone este repositório
2. Abra o Godot Engine
3. Clique em "Import" e selecione o arquivo `project.godot`
4. Pressione F5 ou clique em "Play" para executar o jogo

## 📂 Estrutura do Projeto

```
primeiro-game-alvo/
├── project.godot       # Arquivo de configuração do projeto
├── Main.tscn           # Cena principal do jogo
├── Ball.gd             # Script da bola (arrasto e movimento)
├── Target.gd           # Script do alvo (detecção de colisão)
├── GameManager.gd      # Gerenciador do jogo (lógica principal)
└── README.md           # Este arquivo
```

## 🎯 Funcionalidades

- **Arrasto Suave**: A bola se move de forma suave e natural
- **Detecção de Colisão**: Detecta quando a bola acerta o alvo
- **Efeito Visual**: O alvo pisca quando é atingido
- **Sistema de Reset**: Reinicie o jogo facilmente
- **Interface Simples**: UI intuitiva e limpa

🎨 Efeitos Visuais

Sombras Suaves: Sistema de sombras com gradiente radial que seguem a bola
Partículas de Explosão: Efeito visual colorido quando o alvo é atingido
Animação de Bounce: O alvo cresce e volta com efeito elástico ao ser acertado
Efeito de Piscar: O alvo pisca quando é atingido
Background Personalizado: Fundo claro para melhor visibilidade

## 🛠️ Personalização

### Ajustar a velocidade da bola
No arquivo `Ball.gd`, modifique a variável:
```gdscript
var drag_speed = 300.0  # Aumente para mais rápido, diminua para mais lento
```

### Ajustar o tamanho da bola ou alvo
Nos arquivos `.tscn`, modifique os valores de `radius` dos `CircleShape2D`

## 📝 Licença

Este projeto é de código aberto e está disponível para uso educacional.
