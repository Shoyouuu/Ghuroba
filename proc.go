package main

import (
	"os"
	"os/exec"
	"syscall"
	"time"
)

// === SPAWN ANAK YATIM (Persistent Mode) ===
func spawnChild() {
	cmd := exec.Command(os.Args[0])
	
	// Kasih tanda anti-meledak
	cmd.Env = append(os.Environ(), "I_AM_CHILD=true")
	
	// INI KUNCINYA: Bikin grup proses sendiri supaya gak ikut mati pas Bapak di-CTRL+C
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Setpgid: true, // Anak punya grup sendiri
	}
	
	cmd.Start() 
	// Tanpa cmd.Wait(), Bapak langsung lepas tangan (Anak jadi Yatim)
}

func StartMultiProcess(jumlah int) {
	// Anti Fork-Bomb
	if os.Getenv("I_AM_CHILD") == "true" {
		return
	}

	for i := 0; i < jumlah; i++ {
		go spawnChild()
		time.Sleep(100 * time.Millisecond)
	}
}

