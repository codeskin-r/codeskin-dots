{ pkgs, ... }:

{
  # Instala qemu_full (el correcto para macOS)
  environment.systemPackages = with pkgs; [
    qemu_full
  ];

  # Asegúrate de tener bash o zsh disponibles para que puedas usar qemu fácil
  programs.bash.enable = true;
  programs.zsh.enable = true;

  # Opcional: Agrega un profile.d script para alias útiles
  environment.etc."profile.d/qemu-aliases.sh".text = ''
    # Alias rápidos para QEMU
    alias qemu-x86_64="qemu-system-x86_64 -accel hvf"
    alias qemu-aarch64="qemu-system-aarch64 -accel hvf"
    alias qemu-start="qemu-system-x86_64 -accel hvf -m 2048 -smp 2"
  '';

  environment.etc."profile.d/qemu-run.sh".text = ''
  # Script: qemu-run
  function qemu-run() {
    if [ -z "$1" ]; then
      echo "⚡ Uso: qemu-run <ruta-al-archivo.iso>"
      return 1
    fi

    ISO_PATH="$1"

    if [ ! -f "$ISO_PATH" ]; then
      echo "❌ Error: Archivo no encontrado: $ISO_PATH"
      return 1
    fi

    echo "🚀 Lanzando VM con $ISO_PATH ..."

    qemu-system-x86_64 \
      -accel hvf \
      -m 2048 \
      -smp 2 \
      -cpu host \
      -boot d \
      -cdrom "$ISO_PATH" \
      -vga virtio \
      -display default,show-cursor=on \
      -usb -device usb-mouse -device usb-kbd
  }
'';

}
