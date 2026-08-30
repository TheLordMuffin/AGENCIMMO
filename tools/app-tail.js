
/* ---------- réinitialisation entre deux démonstrations ---------- */
views.addEventListener("click", ev=>{
  if(!ev.target.closest("[data-reset]")) return;
  try{ localStorage.removeItem(STORE); }catch(e){ /* stockage indisponible */ }
  state.mine = []; state.favs = new Set(); state.myThread = null;
  state.draft = blankDraft(); state.step = 0; state.filter = "tous";
  state.current = null; state.chatOpen = null;
  THREADS.forEach(t=>{ t.msgs = t.msgs.filter(m=>m.h !== "maintenant"); });
  go("feed");
  toast("Démo remise à zéro");
});

/* ---------- logotype ---------- */
function keySVG(size){
  return `<svg width="${size}" height="${size}" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <circle cx="8.5" cy="8.5" r="4.6" stroke="#0E5C43" stroke-width="1.9"/>
    <path d="M11.8 11.8 20 20M17 17l2.4-2.4M14.4 14.4l2 2" stroke="#C89A47" stroke-width="1.9" stroke-linecap="round"/>
  </svg>`;
}

/* ---------- démarrage ---------- */
load();
render();
</script>
