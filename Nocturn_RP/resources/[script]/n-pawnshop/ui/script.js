const pawnshopContainer = document.getElementById('pawnshop-container');
const itemsList = document.getElementById('items-list');
const closeBtn = document.getElementById('close-btn');
const adminPanel = document.getElementById('admin-panel');
const playerSelect = document.getElementById('player-select');

// Écouteur pour les messages NUI
window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.type === 'open') {
        pawnshopContainer.classList.remove('hidden');
        displayItems(data.items);
        
        if (data.isAdmin) {
            adminPanel.classList.remove('hidden');
            fetchPlayers();
        } else {
            adminPanel.classList.add('hidden');
        }
    } else if (data.type === 'close') {
        pawnshopContainer.classList.add('hidden');
    } else if (data.type === 'players') {
        updatePlayerList(data.players);
    }
});

// Fermer l'interface
closeBtn.addEventListener('click', function() {
    fetch('https://pawnshop/closeUI', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});

// Afficher les items
function displayItems(items) {
    itemsList.innerHTML = '';
    
    items.forEach(item => {
        const itemCard = document.createElement('div');
        itemCard.className = 'item-card';
        
        const buttons = adminPanel.classList.contains('hidden') 
            ? `
                <div class="item-buttons">
                    <button class="buy-btn" onclick="buyItem('${item.name}')">Acheter</button>
                    <button class="sell-btn" onclick="sellItem('${item.name}')">Vendre</button>
                </div>
            `
            : `
                <div class="item-buttons">
                    <button class="receive-btn" onclick="receiveItem('${item.name}')">Recevoir</button>
                </div>
            `;
        
        itemCard.innerHTML = `
            <h3>${item.name}</h3>
            <p>Prix d'achat: $${item.buyPrice}</p>
            <p>Prix de vente: $${item.sellPrice}</p>
            ${buttons}
        `;
        
        itemsList.appendChild(itemCard);
    });
}

// Récupérer la liste des joueurs
function fetchPlayers() {
    fetch('https://pawnshop/getPlayers', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// Mettre à jour la liste des joueurs
function updatePlayerList(players) {
    playerSelect.innerHTML = '';
    
    players.forEach(player => {
        const option = document.createElement('option');
        option.value = player.id;
        option.textContent = player.name;
        playerSelect.appendChild(option);
    });
}

// Recevoir un item d'un joueur
function receiveItem(itemName) {
    const playerId = playerSelect.value;
    
    if (playerId) {
        fetch('https://pawnshop/receiveItem', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                itemName: itemName,
                playerId: playerId
            })
        });
    }
}

// Acheter un item
function buyItem(itemName) {
    fetch('https://pawnshop/buyItem', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            itemName: itemName
        })
    });
}

// Vendre un item
function sellItem(itemName) {
    fetch('https://pawnshop/sellItem', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            itemName: itemName
        })
    });
} 