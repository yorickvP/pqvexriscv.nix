{ fetchMavenArtifact, runCommandNoCC }:

let
  commons-io = fetchMavenArtifact {
    groupId = "commons-io";
    artifactId = "commons-io";
    version = "2.4";
    sha256 = "108mw2v8ncig29kjvzh8wi76plr01f4x5l3b1929xk5a7vf42snc";
  };

  snakeyaml = fetchMavenArtifact {
    groupId = "org.yaml";
    artifactId = "snakeyaml";
    version = "1.8";
    sha256 = "1z0ybg8azqanrhqjbr57n6sflm7scfxik99j070f9zk7g6ykcl9g";
  };

  scopt = fetchMavenArtifact {
    groupId = "com.github.scopt";
    artifactId = "scopt_2.11";
    version = "3.4.0";
    sha256 = "0y9av2rpnaj3z9zg4chfpxgjx3xqqx9bzcv0jr3n9h4v5fqbc52r";
  };

  oshi-core = fetchMavenArtifact {
    groupId = "com.github.oshi";
    artifactId = "oshi-core";
    version = "3.4.0";
    sha256 = "1mfd1n8giyx5xznzra12qisdi97rry52bkg0pnhbli6f5ly0fb1z";
  };

  jna-platform = fetchMavenArtifact {
    groupId = "net.java.dev.jna";
    artifactId = "jna-platform";
    version = "4.2.2";
    sha256 = "1jpcrll623r9x0zhn171x02rr498m23q5g4vjcfp456blirsib1j";
  };

  slf4j-simple = fetchMavenArtifact {
    groupId = "org.slf4j";
    artifactId = "slf4j-simple";
    version = "1.7.25";
    sha256 = "0x6qv4xlkn8vgjpznm54s3p072nrfkb9vf77v79m5gm5zxpyhrh9";
  };

  slf4j-api = fetchMavenArtifact {
    groupId = "org.slf4j";
    artifactId = "slf4j-api";
    version = "1.7.22";
    sha256 = "0gjmxxplgn34r9arjhwa1fv5yxh1zjx1vn5lnnsbxwqmj2bd8k1s";
  };

  jna = fetchMavenArtifact {
    groupId = "net.java.dev.jna";
    artifactId = "jna";
    version = "4.2.2";
    sha256 = "1gmx27mxsfa6ncki31xlvmfylbcm5c2jrfirpxnnyvkcw1aayf0z";
  };

  affinity = fetchMavenArtifact {
    groupId = "net.openhft";
    artifactId = "affinity";
    version = "3.1.11";
    sha256 = "1g1256pdyd26sp3kls5nllcgzjly3573hbkmn9zl7zk0qyxrix7f";

  };

  spinalhdl-core = fetchMavenArtifact {
    groupId = "com.github.spinalhdl";
    artifactId = "spinalhdl-core_2.11";
    version = "1.3.8";
    sha256 = "13lywy7xv3naplq556hx6iggrnkb3f4dnsdql2vi0l6640racpb0";
  };

  spinalhdl-lib = fetchMavenArtifact {
    groupId = "com.github.spinalhdl";
    artifactId = "spinalhdl-lib_2.11";
    version = "1.3.8";
    sha256 = "0ckbpr73g24bp0pcyj449cvd21z720yn5zc21k9ci56rw5349gy7";
  };

  spinalhdl-sim = runCommandNoCC
    "com_github_spinalhdl_spinalhdl-sim_2_11-1.3.8"
    {} ''
      mkdir -p $out/share/java
cp ${../spinalhdl-sim_2.11-1.3.8.jar} $_/spinalhdl-sim_2.11-1.3.8.jar
   '';
  # spinalhdl-sim = fetchMavenArtifact {
  #   groupId = "com.github.spinalhdl";
  #   artifactId = "spinalhdl-sim_2.11";
  #   version = "1.3.8";
  #   sha256 = "07zn6rz8lbakg2q431aqpk70xrm40c6in6q3apnshj4ss9kj62vx";
  # };

in [ commons-io scopt snakeyaml oshi-core jna jna-platform affinity spinalhdl-core spinalhdl-lib spinalhdl-sim slf4j-simple slf4j-api ]
