// Package gobind provides a simple wrapper around breez-sdk-spark-go
// for testing iOS library loading via gomobile bind.
package gobind

import (
	"fmt"

	"github.com/breez/breez-sdk-spark-go/breez_sdk_spark"
)

// TestLibraryLoaded calls into the native breez SDK library via cgo
// and returns a status string. If this succeeds, the native dylib
// loaded correctly on iOS.
func TestLibraryLoaded() string {
	config := breez_sdk_spark.DefaultConfig(breez_sdk_spark.NetworkMainnet)
	return fmt.Sprintf("Library loaded OK. Network: %v, SyncInterval: %d", config.Network, config.SyncIntervalSecs)
}
