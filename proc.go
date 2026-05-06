package main

import (
	"os"
	"os/exec"
	"syscall"
	"time"
)


func spawnChild() {
	cmd := exec.Command(os.Args[0])
	
	
	cmd.Env = append(os.Environ(), "I_AM_CHILD=true")
	
	
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Setpgid: true, 
	}
	
	cmd.Start() 
	
}

func StartMultiProcess(jumlah int) {
	
	if os.Getenv("I_AM_CHILD") == "true" {
		return
	}

	for i := 0; i < jumlah; i++ {
		go spawnChild()
		time.Sleep(100 * time.Millisecond)
	}
}

