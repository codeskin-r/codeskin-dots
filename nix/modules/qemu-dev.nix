{ pkgs, ... }:

{
  # Instala QEMU completo para macOS
  environment.systemPackages = with pkgs; [
    qemu_full
    fzf  # Necesario para selección de ISO con fzf
  ];

  # Asegura que bash y zsh estén disponibles
  programs.bash.enable = true;
  programs.zsh.enable = true;

  # Alias útiles para QEMU rápido
  environment.etc."profile.d/qemu-aliases.sh".text = ''
    alias qemu-x86="qemu-system-x86_64 --accel hvf -cpu host,-svm"
    alias qemu-start="qemu-system-x86_64 -accel hvf -m 2048 -smp 2"
  '';

  # Script de ejecución de ISOs vía qemu-run
  environment.etc."profile.d/qemu-run.sh".text = ''
    function qemu-run() {
      local ISO_PATH="$1"

      # Si no se pasa un argumento, buscar en carpetas comunes
      if [ -z "$ISO_PATH" ]; then
        echo "🔎 Buscando archivos ISO en ~/Descargas ~/ISOs..."
        ISO_PATH=$(find ~/Downloads ~/ISOs -type f -iname "*.iso" 2>/dev/null | fzf --prompt="Selecciona una ISO: ")
        
        if [ -z "$ISO_PATH" ]; then
          echo "❌ No se seleccionó ningún archivo ISO."
          return 1
        fi
      fi

      # Verifica existencia del archivo
      if [ ! -f "$ISO_PATH" ]; then
        echo "❌ Error: Archivo no encontrado: $ISO_PATH"
        return 1
      fi

      echo "🚀 Lanzando máquina virtual con: $ISO_PATH"

      qemu-system-x86_64 \
        -accel hvf \
        -m 4096 \
        -smp 4 \
        -cpu host,-svm \
        -boot d \
        -cdrom "$ISO_PATH" \
        -vga virtio \
        -display default,show-cursor=off \
        -usb -device usb-mouse -device usb-kbd
    }
  '';
  environment.etc."profile.d/qemu-run-advanced.sh".text = ''
    function qemu-run-advanced() {
  echo "⚙️  Selecciona un archivo ISO para lanzar:"
  ISO_PATH=$(find ~/Downloads ~/ISOs -type f -iname "*.iso" 2>/dev/null | fzf --prompt="Selecciona una ISO: ")

  if [ -z "$ISO_PATH" ]; then
    echo "❌ No se seleccionó ningún archivo ISO."
    return 1
  fi

  echo "📦 ¿Quieres crear un disco virtual para instalar el sistema? (s/n)"
  read -r RESPUESTA

  if [[ "$RESPUESTA" == "s" || "$RESPUESTA" == "S" ]]; then
    DISK_IMG="$HOME/VMs/$(basename "$ISO_PATH" .iso)-disk.qcow2"
    mkdir -p "$HOME/VMs"

    if [ ! -f "$DISK_IMG" ]; then
      echo "🛠️  Creando disco virtual en: $DISK_IMG ..."
      qemu-img create -f qcow2 "$DISK_IMG" 20G
    fi

    echo "🚀 Lanzando instalación..."
    qemu-system-x86_64 \
      -accel hvf \
      -m 4096 \
      -smp 4 \
      -cpu host,-svm \
      -boot d \
      -cdrom "$ISO_PATH" \
      -drive file="$DISK_IMG",format=qcow2 \
      -vga virtio \
      -display default,show-cursor=on \
      -usb -device usb-mouse -device usb-kbd

  else
    echo "🚀 Lanzando en modo Live (sin disco virtual)..."
    qemu-system-x86_64 \
      -accel hvf \
      -m 4096 \
      -smp 4 \
      -cpu host,-svm \
      -boot d \
      -cdrom "$ISO_PATH" \
      -vga virtio \
      -display default,show-cursor=on \
      -usb -device usb-mouse -device usb-kbd
  fi
}
'';

  # 👇 Corrección para que siempre se lea /etc/profile en shells interactivos
  programs.zsh.interactiveShellInit = ''
    source /etc/profile
  '';

  programs.bash.interactiveShellInit = ''
    source /etc/profile
  '';
}

