{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    fzf
    virt-viewer
  ];

  # Asegura que QEMU esté primero en el PATH
  environment.variables.PATH = "/usr/local/bin:${pkgs.qemu}/bin:$PATH";

  # Alias directamente en shellInit para zsh en nix-darwin
  environment.shellInit = ''
    alias qemu-x86="qemu-system-x86_64 --accel hvf -cpu Haswell"
    alias qemu-start="qemu-system-x86_64 -accel hvf -m 2048 -smp 2 -cpu Haswell"
  '';

  # Script simple
  environment.etc."profile.d/qemu-run.sh".text = ''
    function qemu-run() {
      local ISO_PATH="$1"
      if [ -z "$ISO_PATH" ]; then
        ISO_PATH=$(find ~/Downloads ~/ISOs -type f -iname "*.iso" 2>/dev/null \
          | fzf --prompt="Selecciona una ISO: ")
        [ -z "$ISO_PATH" ] && { echo "❌ Ninguna ISO seleccionada"; return 1; }
      fi
      [ ! -f "$ISO_PATH" ] && {
        echo "❌ ISO no existe: $ISO_PATH"; return 1;
      }
      echo "🚀 Iniciando VM con: $ISO_PATH"
      qemu-system-x86_64 -accel hvf -m 4096 -smp 4 -cpu Haswell \
        -boot d -cdrom "$ISO_PATH" -vga virtio \
        -display default,show-cursor=off \
        -usb -device usb-mouse -device usb-kbd
    }
  '';

  # Script avanzado
  environment.etc."profile.d/qemu-run-advanced.sh".text = ''
    function qemu-run-advanced() {
      ISO_PATH=$(find ~/Downloads ~/ISOs -type f -iname "*.iso" 2>/dev/null \
        | fzf --prompt="Selecciona una ISO: ")
      [ -z "$ISO_PATH" ] && { echo "❌ Ninguna ISO seleccionada"; return 1; }
      echo "📦 Crear disco virtual? (s/n)"
      read -r RESPUESTA
      if [[ "$RESPUESTA" =~ ^[sS]$ ]]; then
        DISK_IMG="$HOME/VMs/$(basename "$ISO_PATH" .iso)-disk.qcow2"
        mkdir -p "$HOME/VMs"
        [ ! -f "$DISK_IMG" ] && \
          qemu-img create -f qcow2 "$DISK_IMG" 20G
        echo "🚀 Instalando en: $DISK_IMG"
        qemu-system-x86_64 -accel hvf -m 4096 -smp 4 -cpu Haswell \
          -boot d -cdrom "$ISO_PATH" \
          -drive file="$DISK_IMG",format=qcow2 \
          -vga virtio -display default,show-cursor=on \
          -usb -device usb-mouse -device usb-kbd
      else
        qemu-run "$ISO_PATH"
      fi
    }
  '';
}

