FROM ubuntu

CMD ["bash", "-lc", "echo $A; echo $B; echo $C; ls -alh /check; touch /check/a.txt; cat /check/repos.json; ls -alh /check"]

