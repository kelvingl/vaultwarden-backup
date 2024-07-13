package cmd

import (
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "vaultwarden-backup",
	Short: "Periodically backups vaultwarden data",
	Long:  `Periodically backups vaultwarden data`,
}

func Execute() {
	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}
