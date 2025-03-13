// Tooltip Fix Script
document.addEventListener('DOMContentLoaded', function() {
    // Attendre que Vue soit initialisé
    setTimeout(() => {
        // Forcer la réinitialisation des tooltips
        const itemSlots = document.querySelectorAll('.item-slot-img');
        
        itemSlots.forEach(slot => {
            // Ajouter un événement de survol manuel
            slot.addEventListener('mouseenter', function(e) {
                const itemData = getItemDataFromElement(slot);
                if (!itemData) return;
                
                showManualTooltip(e, itemData, slot);
            });
            
            slot.addEventListener('mouseleave', function() {
                hideManualTooltip();
            });
        });
    }, 1000);
    
    // Fonction pour extraire les données d'item de l'élément
    function getItemDataFromElement(element) {
        // Cette fonction doit être adaptée à la structure de vos données
        // Pour l'instant, nous utilisons une approche simplifiée
        const img = element.querySelector('img');
        if (!img) return null;
        
        const src = img.getAttribute('src');
        const itemName = src.replace('images/', '').replace('.png', '');
        
        // Trouver l'élément parent qui contient les données
        const slotElement = element.closest('.item-slot');
        if (!slotElement) return null;
        
        // Essayer de trouver la quantité
        let amount = "1";
        const amountElement = slotElement.querySelector('.item-slot-amount p');
        if (amountElement) {
            amount = amountElement.textContent.replace('x', '').trim();
        }
        
        return {
            name: itemName,
            amount: amount
        };
    }
    
    // Créer et afficher un tooltip manuel
    function showManualTooltip(event, itemData, element) {
        // Supprimer tout tooltip existant
        hideManualTooltip();
        
        // Créer un nouvel élément tooltip
        const tooltip = document.createElement('div');
        tooltip.id = 'manual-tooltip';
        tooltip.className = 'custom-tooltip';
        tooltip.style.position = 'absolute';
        tooltip.style.zIndex = '10000';
        
        // Contenu du tooltip
        tooltip.innerHTML = `
            <div class="tooltip-header">${itemData.name}</div>
            <hr class="tooltip-divider">
            <div class="tooltip-info">Quantité: ${itemData.amount}</div>
            <div class="tooltip-weight">Poids: 0.5 kg</div>
        `;
        
        // Ajouter au DOM
        document.body.appendChild(tooltip);
        
        // Positionner le tooltip
        positionTooltip(event, tooltip, element);
        
        // Suivre le mouvement de la souris
        element.addEventListener('mousemove', function(e) {
            positionTooltip(e, tooltip, element);
        });
    }
    
    // Positionner le tooltip par rapport à la souris
    function positionTooltip(event, tooltip, element) {
        const rect = element.getBoundingClientRect();
        const tooltipRect = tooltip.getBoundingClientRect();
        
        // Positionner à droite de l'élément
        let left = rect.right + 10;
        let top = rect.top;
        
        // Vérifier si le tooltip dépasse de l'écran
        if (left + tooltipRect.width > window.innerWidth) {
            left = rect.left - tooltipRect.width - 10;
        }
        
        tooltip.style.left = `${left}px`;
        tooltip.style.top = `${top}px`;
    }
    
    // Cacher le tooltip manuel
    function hideManualTooltip() {
        const existingTooltip = document.getElementById('manual-tooltip');
        if (existingTooltip) {
            existingTooltip.remove();
        }
    }
}); 