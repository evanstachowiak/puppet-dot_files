define dot_files::symlink (
  $target = $name,
  $source,
) {

  include dot_files
  $source_path = "${::dot_files::repo_dir}/${source}"
  Vcsrepo[$::dot_files::repo_dir] -> File[$source_path]
  file { $source_path:
    ensure => 'link',
    target => "~/${target}",
  }

}
