set shell := ["nu", "-c"]

destroy-link DIR:
    let link = (ls . --long | where name == {{DIR}} | get target.0); \
    rm {{DIR}} -rf; \
    cp $link {{DIR}} --recursive

restore-link DIR TARGET:
    rm {{DIR}} -rf;
    mklink /D {{DIR}} {{TARGET}}
    
