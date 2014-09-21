# Recompile blog and sync files with public area
notification :libnotify
  
guard :shell do
  watch(/./) {
    |m|
    begin
      `bundle exec ruhoh compile`
      raise "Recompile failed" unless $? == 0
      `rsync -a compiled/blog/ ../../public/blog/`
      raise "Rsync failed" unless $? == 0
    rescue RuntimeError => exc
        n m[0], exc.message, :failed
    end
    n m[0], 'Blog Recompiled & Synced', :success
  }
  ignore(/compiled/)
  ignore(/#/)
end
