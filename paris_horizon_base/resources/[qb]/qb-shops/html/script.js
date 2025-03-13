let cart = {};
let maxStackSizes = {};

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        if (event.data.action === "openShop") {
            $("#shop-name").text(event.data.shopName);
            $("#player-money").text("Cash: $" + event.data.playerMoney);
            maxStackSizes = event.data.maxStackSizes;
            populateItems(event.data.items);
            $("#shop-container").removeClass("hidden");
        }
    });

    $("#close-button").click(function() {
        $("#shop-container").addClass("hidden");
        $.post('https://qb-shops/closeShop', JSON.stringify({}));
        cart = {};
        updateCartDisplay();
    });

    $("#purchase-button").click(function() {
        if (Object.keys(cart).length > 0) {
            showConfirmation();
        }
    });

    $("#confirm-yes").click(function() {
        $.post('https://qb-shops/purchaseItems', JSON.stringify({
            items: cart
        }));
        cart = {};
        updateCartDisplay();
        $("#confirmation-popup").addClass("hidden");
        $("#shop-container").addClass("hidden");
    });

    $("#confirm-no").click(function() {
        $("#confirmation-popup").addClass("hidden");
    });
});

function populateItems(items) {
    const container = $("#shop-items");
    container.empty();
    
    items.forEach(item => {
        const itemElement = $(`
            <div class="shop-item" data-name="${item.name}">
                <img src="${item.image}" class="item-image">
                <div class="item-name">${item.label}</div>
                <div class="item-price">$${item.price}</div>
                <div class="item-stock">Stock: ${item.amount}</div>
                <div class="quantity-controls">
                    <button class="quantity-btn minus">-</button>
                    <span class="quantity-display">0</span>
                    <button class="quantity-btn plus">+</button>
                </div>
            </div>
        `);

        const maxStack = maxStackSizes[item.name] || 100;
        
        itemElement.find('.minus').click(() => updateQuantity(item, -1, maxStack));
        itemElement.find('.plus').click(() => updateQuantity(item, 1, maxStack));

        container.append(itemElement);
    });
}

function updateQuantity(item, change, maxStack) {
    if (!cart[item.name]) {
        cart[item.name] = {
            amount: 0,
            price: item.price,
            label: item.label
        };
    }

    const newAmount = cart[item.name].amount + change;
    if (newAmount >= 0 && newAmount <= maxStack) {
        cart[item.name].amount = newAmount;
        if (newAmount === 0) {
            delete cart[item.name];
        }
    }

    updateCartDisplay();
}

function updateCartDisplay() {
    let total = 0;
    const cartItems = $("#cart-items");
    cartItems.empty();

    for (let itemName in cart) {
        const item = cart[itemName];
        total += item.amount * item.price;
        
        cartItems.append(`
            <div class="cart-item">
                <span>${item.label} x${item.amount}</span>
                <span>$${item.amount * item.price}</span>
            </div>
        `);

        $(`.shop-item[data-name="${itemName}"] .quantity-display`).text(item.amount);
    }

    // Mettre à jour les quantités affichées pour les items qui ne sont pas dans le panier
    $('.shop-item').each(function() {
        const itemName = $(this).data('name');
        if (!cart[itemName]) {
            $(this).find('.quantity-display').text('0');
        }
    });

    $("#cart-total").text("Total: $" + total);
}

function showConfirmation() {
    let confirmationItems = $("#confirmation-items");
    confirmationItems.empty();
    let total = 0;

    for (let itemName in cart) {
        const item = cart[itemName];
        total += item.amount * item.price;
        
        confirmationItems.append(`
            <div class="confirmation-item">
                <span>${item.label} x${item.amount}</span>
                <span>$${item.amount * item.price}</span>
            </div>
        `);
    }

    $("#confirmation-total").text(`Total: $${total}`);
    $("#confirmation-popup").removeClass("hidden");
} 