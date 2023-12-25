cd ..
cargo build --release 
xcopy target\release\wstunnel.exe bin\ /y /d /q
cd script