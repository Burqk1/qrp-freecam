import { createApp } from 'vue';

console.log('[Enhanced-Freecam] Vue imported, createApp:', typeof createApp);

createApp({
    data() {
        return {
            isVisible: false,
            showFullMenu: false,
        };
    },
    methods: {
        handleMessage(event) {
            const data = event.data;
            console.log('[Enhanced-Freecam] Message received:', data);

            if (data.action === 'showUI') {
                this.isVisible = data.show;
                console.log('[Enhanced-Freecam] isVisible set to:', this.isVisible);
                if (!data.show) {
                    this.showFullMenu = false;
                }
            } else if (data.action === 'toggleMenu') {
                this.showFullMenu = !this.showFullMenu;
                console.log('[Enhanced-Freecam] showFullMenu toggled to:', this.showFullMenu);
            }
        },

        handleKeyDown(event) {
            if (event.key === 'Escape') {
                this.closeUI();
            }
        },

        closeUI() {
            this.isVisible = false;
            fetch(`https://${GetParentResourceName()}/closeUI`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        }
    },
    mounted() {
        window.addEventListener('message', this.handleMessage);
        window.addEventListener('keydown', this.handleKeyDown);
    },
    beforeUnmount() {
        window.removeEventListener('message', this.handleMessage);
        window.removeEventListener('keydown', this.handleKeyDown);
    }
}).mount('#app');

function GetParentResourceName() {
    let resourceName = 'qrp-freecam';

    if (window.location && window.location.hostname) {
        const matches = window.location.hostname.match(/^([a-z0-9_-]+)\./i);
        if (matches && matches[1]) {
            resourceName = matches[1];
        }
    }

    return resourceName;
}
