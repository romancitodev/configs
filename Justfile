set shell := ["nu", "-c"]

destroy-link DIR:
    let path = r#'{{DIR}}'# | path dirname; \
    let link = (ls $path --long | where name == r#'{{DIR}}'# | get target.0); \
    rm {{DIR}} -rf; \
    cp $link {{DIR}} --recursive

restore-link DIR TARGET:
    rm {{DIR}} -rf;
    mklink /D {{DIR}} {{TARGET}}
    
