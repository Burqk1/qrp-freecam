<template>
    <div class="w-screen h-screen overflow-hidden bg-transparent relative">
        <div v-if="isVisible && !showFullMenu" class="fixed right-0 top-1/2 -translate-y-1/2 w-[150px] animate-[slideInRight_0.4s_ease_forwards]">
            <svg class="absolute top-0 left-0 w-full h-auto pointer-events-none" viewBox="0 0 218 78" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g filter="url(#filter0_d_53_2)">
                    <path d="M4 30C4 13.4315 17.4315 0 34 0H214V40C214 56.5685 200.569 70 184 70H4V30Z" fill="#080B0F" fill-opacity="0.9" shape-rendering="crispEdges"/>
                </g>
                <defs>
                    <filter id="filter0_d_53_2" x="0" y="0" width="218" height="78" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                        <feOffset dy="4"/>
                        <feGaussianBlur stdDeviation="2"/>
                        <feComposite in2="hardAlpha" operator="out"/>
                        <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_53_2"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_53_2" result="shape"/>
                    </filter>
                </defs>
            </svg>

            <div class="relative flex items-center justify-center min-h-[50px] px-4 gap-2">
                <kbd class="px-2 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[3px] border-[#777] text-sm">H</kbd>
                <span class="text-sm font-semibold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">YARDIM</span>
            </div>
        </div>

        <div v-if="isVisible && showFullMenu" class="fixed bottom-10 left-1/2 -translate-x-1/2 w-full max-w-[480px] px-4 animate-[fadeInUp_0.4s_ease_forwards]" style="z-index: 1000;">
            <div class="relative">
                <svg class="absolute top-0 left-0 w-full h-auto pointer-events-none" viewBox="0 0 588 310" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g filter="url(#filter0_dd_53_9)">
                    <path d="M4 30C4 13.4315 17.4315 0 34 0H584V275C584 291.569 570.569 305 554 305H4V30Z" fill="#080B0F" fill-opacity="0.9" shape-rendering="crispEdges"/>
                </g>
                <defs>
                    <filter id="filter0_dd_53_9" x="0" y="0" width="588" height="313" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                        <feOffset dy="4"/>
                        <feGaussianBlur stdDeviation="2"/>
                        <feComposite in2="hardAlpha" operator="out"/>
                        <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_53_9"/>
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                        <feOffset dy="4"/>
                        <feGaussianBlur stdDeviation="2"/>
                        <feComposite in2="hardAlpha" operator="out"/>
                        <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
                        <feBlend mode="normal" in2="effect1_dropShadow_53_9" result="effect2_dropShadow_53_9"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect2_dropShadow_53_9" result="shape"/>
                    </filter>
                </defs>
            </svg>

            <div class="relative px-5 sm:px-7 md:px-9 py-5 sm:py-6 flex flex-col justify-evenly gap-2.5 sm:gap-3.5 min-h-[250px]">
                <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-3">
                    <div class="flex items-center gap-1.5 sm:gap-2">
                        <div class="w-5 h-5 flex items-center justify-center bg-white/5 rounded p-0.5">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.5))">
                                <path d="M12 8V16M8 12H16" stroke="white" stroke-width="2" stroke-linecap="round"/>
                                <circle cx="12" cy="12" r="9" stroke="white" stroke-width="2"/>
                            </svg>
                        </div>
                        <div class="text-[10px] sm:text-xs md:text-sm font-bold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">YÖNLENDİRME</div>
                    </div>
                    <div class="text-lg sm:text-xl text-white/30 font-thin mx-1">|</div>
                    <div class="flex items-center justify-end gap-1 flex-wrap">
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">W</kbd>
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">A</kbd>
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">S</kbd>
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">D</kbd>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-3">
                    <div class="flex items-center gap-1.5 sm:gap-2">
                        <div class="w-5 h-5 flex items-center justify-center bg-white/5 rounded p-0.5">
                            <svg width="14" height="14" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" style="filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.5))">
                                <path d="M25 2.30219V8.42088C25 8.82657 24.842 9.21565 24.5607 9.50252C24.2794 9.78939 23.8978 9.95055 23.5 9.95055H17.5C17.1022 9.95055 16.7206 9.78939 16.4393 9.50252C16.158 9.21565 16 8.82657 16 8.42088C16 8.01518 16.158 7.62611 16.4393 7.33924C16.7206 7.05237 17.1022 6.89121 17.5 6.89121H19.875L18.9 5.89692C17.1348 4.08785 14.7376 3.06728 12.235 3.05938H12.1812C9.701 3.05384 7.31834 4.04435 5.54875 5.81661C5.26431 6.10026 4.88102 6.25706 4.48321 6.25252C4.08539 6.24798 3.70565 6.08246 3.4275 5.79239C3.14935 5.50232 2.9956 5.11145 3.00005 4.70577C3.0045 4.30009 3.16681 3.91283 3.45125 3.62918C5.78152 1.29574 8.91914 -0.0080392 12.185 3.73008e-05H12.25C15.5447 0.00919793 18.701 1.35216 21.025 3.73371L22 4.72417V2.30219C22 1.8965 22.158 1.50742 22.4393 1.22055C22.7206 0.933682 23.1022 0.772521 23.5 0.772521C23.8978 0.772521 24.2794 0.933682 24.5607 1.22055C24.842 1.50742 25 1.8965 25 2.30219ZM19.4513 19.1834C17.6807 20.9566 15.2965 21.9472 12.815 21.9406H12.7612C10.2587 21.9327 7.86147 20.9121 6.09625 19.1031L5.125 18.1088H7.5C7.89782 18.1088 8.27936 17.9476 8.56066 17.6608C8.84196 17.3739 9 16.9848 9 16.5791C9 16.1734 8.84196 15.7844 8.56066 15.4975C8.27936 15.2106 7.89782 15.0495 7.5 15.0495H1.5C1.10218 15.0495 0.720644 15.2106 0.43934 15.4975C0.158035 15.7844 0 16.1734 0 16.5791V22.6978C0 23.1035 0.158035 23.4926 0.43934 23.7794C0.720644 24.0663 1.10218 24.2275 1.5 24.2275C1.89782 24.2275 2.27936 24.0663 2.56066 23.7794C2.84196 23.4926 3 23.1035 3 22.6978V20.2758L3.975 21.2701C6.29965 23.6503 9.45586 24.9918 12.75 25H12.82C16.0859 25.008 19.2235 23.7043 21.5537 21.3708C21.6946 21.2304 21.8069 21.063 21.8843 20.8783C21.9618 20.6936 22.0027 20.4951 22.0049 20.2942C22.0072 20.0934 21.9705 19.894 21.8972 19.7076C21.8239 19.5211 21.7152 19.3512 21.5775 19.2076C21.4398 19.064 21.2757 18.9494 21.0945 18.8705C20.9134 18.7915 20.7188 18.7497 20.5218 18.7475C20.3248 18.7452 20.1293 18.7826 19.9465 18.8574C19.7637 18.9322 19.5971 19.0429 19.4562 19.1834H19.4513Z" fill="white"/>
                            </svg>
                        </div>
                        <div class="text-[10px] sm:text-xs md:text-sm font-bold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">DÖNDÜRME</div>
                    </div>
                    <div class="text-lg sm:text-xl text-white/30 font-thin mx-1">|</div>
                    <div class="flex items-center justify-end gap-1 flex-wrap">
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">E</kbd>
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">Q</kbd>
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">SPACE</kbd>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-3">
                    <div class="flex items-center gap-1.5 sm:gap-2">
                        <div class="w-5 h-5 flex items-center justify-center bg-white/5 rounded p-0.5">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.5))">
                                <path d="M13 10V3L4 14H11L11 21L20 10L13 10Z" stroke="white" stroke-width="2" stroke-linejoin="round"/>
                            </svg>
                        </div>
                        <div class="text-[10px] sm:text-xs md:text-sm font-bold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">HIZ</div>
                    </div>
                    <div class="text-lg sm:text-xl text-white/30 font-thin mx-1">|</div>
                    <div class="flex items-center justify-end gap-1">
                        <kbd class="px-2 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">SHIFT</kbd>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-3">
                    <div class="flex items-center gap-1.5 sm:gap-2">
                        <div class="w-5 h-5 flex items-center justify-center bg-white/5 rounded p-0.5">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.5))">
                                <circle cx="12" cy="12" r="3" stroke="white" stroke-width="2"/>
                                <path d="M12 5V7M12 17V19M19 12H17M7 12H5" stroke="white" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                        </div>
                        <div class="text-[10px] sm:text-xs md:text-sm font-bold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">YAKINLAŞTIRMA</div>
                    </div>
                    <div class="text-lg sm:text-xl text-white/30 font-thin mx-1">|</div>
                    <div class="flex items-center justify-end gap-1">
                        <kbd class="px-1.5 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[9px]">SCROLL</kbd>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-3">
                    <div class="flex items-center gap-1.5 sm:gap-2">
                        <div class="w-5 h-5 flex items-center justify-center bg-white/5 rounded p-0.5">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.5))">
                                <path d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </div>
                        <div class="text-[10px] sm:text-xs md:text-sm font-bold text-white tracking-wide" style="text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8)">MENÜYÜ GİZLE</div>
                    </div>
                    <div class="text-lg sm:text-xl text-white/30 font-thin mx-1">|</div>
                    <div class="flex items-center justify-end gap-1">
                        <kbd class="px-2 py-0.5 bg-[#ccc] text-[#212529] font-bold rounded border-b-[2px] border-[#777] text-[10px]">Z</kbd>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'App',
    data() {
        return {
            isVisible: false,
            showFullMenu: false,
        };
    },
    methods: {
        handleMessage(event) {
            const data = event.data;

            if (data.action === 'showUI') {
                this.isVisible = data.show;
                if (!data.show) {
                    this.showFullMenu = false;
                }
            } else if (data.action === 'toggleMenu') {
                this.showFullMenu = !this.showFullMenu;
            }
        },

        handleKeyDown(event) {
            if (event.key === 'Escape') {
                this.closeUI();
            }
        },

        closeUI() {
            this.isVisible = false;
            fetch(`https://${this.GetParentResourceName()}/closeUI`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        },

        GetParentResourceName() {
            let resourceName = 'enhanced-freecam';

            if (window.location && window.location.hostname) {
                const matches = window.location.hostname.match(/^([a-z0-9_-]+)\./i);
                if (matches && matches[1]) {
                    resourceName = matches[1];
                }
            }

            return resourceName;
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
};
</script>

<style>
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(100%) translateY(-50%);
    }
    to {
        opacity: 1;
        transform: translateX(0) translateY(-50%);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateX(-50%) translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateX(-50%) translateY(0);
    }
}
</style>
