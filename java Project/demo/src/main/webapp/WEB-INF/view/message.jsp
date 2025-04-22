<!DOCTYPE html>
<html>
<head>
<title>3x3 Sliding Tic Tac Toe</title>
<style>
body {
    background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
    background-repeat: no-repeat;
    text-align: center;
    font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
    height: 100vh;
    padding: 80px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin: 0;
}

#game-container {
    height: 70vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

#board {
    height: 60vmin;
    width: 60vmin;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    gap: 1.5vmin;
}

.cell {
    height: 18vmin;
    width: 18vmin;
    border-radius: 5px;
    border: none;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    font-size: 10vmin;
    color: #3a5a40;
    cursor: pointer;
}

#message {
    color: #3a5a40;
    font-size: 8vmin;
    margin-bottom: 20px;
}

#reset-button, #newbtn {
    height: 6vmin;
    width: 18vmin;
    border-radius: 3px;
    border: 4px solid #33ccff;
    background-color: black;
    color: #33ccff;
    padding: 1px;
    font-size: 3.5vmin;
    margin-top: 20px;
    cursor: pointer;
}

#newbtn {
    width: 19vmin;
    border: 4px solid #ff99cc;
    color: #ff99cc;
    font-size: 3vmin;
}

.msg-c {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 5px;
}

.hide {
    display: none;
}
</style>
</head>
<body>

<main>
    <div class="msg-c hide">
        <p id="pp">Winner</p>
        <button id="newbtn" onclick="resetGame()">New Game</button>
    </div>
    <h1>Tic Tac Toe</h1>

    <div id="game-container">
        <div id="board"></div>
    </div>
    <button id="reset-button" onclick="resetGame()">Reset Game</button>
</main>

<script>
const board = document.getElementById('board');
const message = document.getElementById('message');
const msgcontaner = document.querySelector(".msg-c");
const pp = document.querySelector("#pp");

let currentPlayer = 'O';
let gameBoard = Array(9).fill(null);
let xMoves = [];
let oMoves = [];
let turnO = true;

function createBoard() {
    for (let i = 0; i < 9; i++) {
        const cell = document.createElement('button');
        cell.classList.add('cell');
        cell.dataset.index = i;
        cell.addEventListener('click', () => cellClick(i));
        board.appendChild(cell);
    }
}

function cellClick(index) {
    if (gameBoard[index]) return;

    gameBoard[index] = currentPlayer;
    document.querySelector(`[data-index="${index}"]`).textContent = currentPlayer;

    if (currentPlayer === 'O') {
        oMoves.push(index);
        if (oMoves.length > 3) {
            let removedIndex = oMoves.shift();
            gameBoard[removedIndex] = null;
            document.querySelector(`[data-index="${removedIndex}"]`).textContent = '';
        }
    } else {
        xMoves.push(index);
        if (xMoves.length > 3) {
            let removedIndex = xMoves.shift();
            gameBoard[removedIndex] = null;
            document.querySelector(`[data-index="${removedIndex}"]`).textContent = '';
        }
    }

    if (checkWin()) {
        pp.innerHTML = "Congratulations to Winner ";
        msgcontaner.classList.remove("hide");
        disablebox();
    } else if (gameBoard.every(cell => cell)) {
        pp.innerHTML = "It's a draw!";
        msgcontaner.classList.remove("hide");
        disablebox();
    } else {
        currentPlayer = currentPlayer === 'O' ? 'X' : 'O';
        turnO = !turnO;
        let cong = document.getElementById("pp")
        cong.style.color = "blue";
        cong.style.fontSize = "23px";
    }
}

function checkWin() {
    const lines = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ];

    for (const line of lines) {
        const [a, b, c] = line;
        if (gameBoard[a] && gameBoard[a] === gameBoard[b] && gameBoard[a] === gameBoard[c]) {
            return true;
        }
    }
    return false;
}

function resetGame() {
    gameBoard = Array(9).fill(null);
    currentPlayer = 'O';
    xMoves = [];
    oMoves = [];
    document.querySelectorAll('.cell').forEach(cell => cell.textContent = '');
    msgcontaner.classList.add("hide");
    enablebtn();
    turnO = true;
}

function disablebox() {
    for (box of document.querySelectorAll('.cell')) {
        box.disabled = true;
    }
}

function enablebtn() {
    for (box of document.querySelectorAll('.cell')) {
        box.disabled = false;
    }
}

createBoard();
</script>

</body>
</html>