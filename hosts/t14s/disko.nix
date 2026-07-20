{

  fileSystems."/nix".neededForBoot = true;
  fileSystems."/persistent".neededForBoot = true;

  disko = {
    devices = {

      nodev = { # tempfs storage

        "/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };
      };

      disk = {  # disk storage

        main = {
          device = "/dev/nvme0n1";
          type = "disk";

          content = {
            type = "gpt";

            partitions = {
              boot = {
                name = "boot";
                size = "1M";
                type = "EF02";
              };

              esp = {
                name = "ESP";
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                };
              };

              #swap = {
              #  size = "4G";
              #  content = {
              #    type = "swap";
              #    resumeDevice = true;
              #  };
              #};

              root = {
                name = "root";
                size = "100%";

                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];

                  subvolumes = {
                    "/persistent" = {
                      mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ];
                      mountpoint = "/persistent";
                    };

                    "/nix" = {
                      mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ];
                      mountpoint = "/nix";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };

}
