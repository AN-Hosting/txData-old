window.addEventListener('message', function(event) {
    if (event.data.action === "openShop") {
        $("#shop-name").text(event.data.shopName);
        $("#player-money").text("Cash: $" + event.data.playerMoney);
        populateItems(event.data.items);
        $("#shop-container").removeClass("hidden");
    }
});

function populateItems(items) {
    const container = $("#shop-items");
    container.empty();
    
    items.forEach(item => {
        const itemElement = $(` 
            <div class="shop-item" data-name="${item.name}">
                <img src="${item.image}" class="item-image">
                <div class="item-name">${item.label}</div>
                <div class="item-price">Prix: $${item.price} / unité</div>
                <div class="item-stock">Quantité détenue: ${item.amount}</div>
                <div class="quantity-controls">
                    <button class="quantity-btn minus">-</button>
                    <span class="quantity-display">0</span>
                    <button class="quantity-btn plus">+</button>
                </div>
            </div>
        `);

        itemElement.find('.minus').click(() => updateQuantity(item, -1, item.amount));
        itemElement.find('.plus').click(() => updateQuantity(item, 1, item.amount));

        container.append(itemElement);
    });
}

$("#purchase-button").off().click(function() {
    if (Object.keys(cart).length > 0) {
        $.post('https://npc_buyer/sellItems', JSON.stringify({
            items: cart
        }));
        cart = {};
        updateCartDisplay();
        $("#shop-container").addClass("hidden");
    }
});
