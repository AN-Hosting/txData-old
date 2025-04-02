$(document).ready(function() {
    let quoteItems = [];
    let inventory = [];

    // Gestion des messages NUI
    window.addEventListener('message', function(event) {
        if (event.data.type === "show") {
            $("#pawnshop-container").removeClass("hidden");
            populateItems(event.data.items);
            inventory = event.data.inventory;
            populateInventory();
        } else if (event.data.type === "hide") {
            $("#pawnshop-container").addClass("hidden");
        } else if (event.data.type === "updateInventory") {
            inventory = event.data.inventory;
            populateInventory();
        }
    });

    // Gestion des onglets
    $(".tab-btn").click(function() {
        const tab = $(this).data("tab");
        $(".tab-btn").removeClass("active");
        $(this).addClass("active");
        $(".tab-content").removeClass("active");
        $(`#${tab}-tab`).addClass("active");
    });

    // Fermer le menu
    $(".close-btn").click(function() {
        $("#pawnshop-container").addClass("hidden");
        $.post('https://ph-pawnshop/closeMenu', JSON.stringify({}));
    });

    // Fermer avec ESC
    $(document).keyup(function(e) {
        if (e.key === "Escape") {
            $("#pawnshop-container").addClass("hidden");
            $.post('https://ph-pawnshop/closeMenu', JSON.stringify({}));
        }
    });

    // Gestion du panier
    function updateCart() {
        let total = 0;
        quoteItems.forEach(item => {
            total += item.price * item.amount;
        });
        $("#total-amount").text(`$${total}`);
    }

    // Afficher les items disponibles
    function populateItems(items) {
        const container = $("#items-container");
        container.empty();

        items.forEach(item => {
            const itemCard = `
                <div class="item-card" data-item="${item.value}">
                    <div class="item-image">
                        <i class="fas fa-gem"></i>
                    </div>
                    <div class="item-name">${item.label}</div>
                    <div class="item-description">${item.description}</div>
                    <div class="item-price">Prix de base: $${item.basePrice}</div>
                    <div class="item-actions">
                        <input type="number" class="amount-input" min="1" value="1">
                        <input type="number" class="price-input" value="${item.basePrice}" placeholder="Prix négocié">
                        <button class="add-to-cart-btn" data-item="${item.value}">
                            <i class="fas fa-plus"></i> Ajouter au devis
                        </button>
                    </div>
                </div>
            `;
            container.append(itemCard);
        });

        // Gestion des clics sur les boutons d'ajout au devis
        $(".add-to-cart-btn").click(function(e) {
            e.stopPropagation();
            const itemCard = $(this).closest('.item-card');
            const itemValue = $(this).data("item");
            const amount = parseInt(itemCard.find('.amount-input').val());
            const price = parseInt(itemCard.find('.price-input').val());

            if (amount > 0 && price > 0) {
                quoteItems.push({ 
                    item: itemValue, 
                    amount: amount,
                    price: price
                });
                updateCart();
                $(this).html('<i class="fas fa-check"></i> Ajouté');
                $(this).prop('disabled', true);
            } else {
                alert('Veuillez entrer un montant et un prix valides');
            }
        });
    }

    // Afficher l'inventaire
    function populateInventory() {
        const container = $("#inventory-container");
        container.empty();

        inventory.forEach(item => {
            const itemCard = `
                <div class="item-card" data-item="${item.name}">
                    <div class="item-image">
                        <i class="fas fa-box"></i>
                    </div>
                    <div class="item-name">${item.label}</div>
                    <div class="item-description">Quantité: ${item.amount}</div>
                    <div class="item-price">Prix de vente: $${item.sellPrice}</div>
                </div>
            `;
            container.append(itemCard);
        });
    }

    // Gestion du bouton de validation
    $("#checkout-btn").click(function() {
        if (quoteItems.length > 0) {
            $.post('https://ph-pawnshop/checkout', JSON.stringify({
                items: quoteItems
            }));
            quoteItems = [];
            updateCart();
            alert('Devis créé avec succès !');
        } else {
            alert('Veuillez ajouter des items au devis');
        }
    });
}); 