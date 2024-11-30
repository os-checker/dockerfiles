FROM ubuntu

CMD ["bash", "-lc", "ls -alh /check; touch /check/a.txt; cat /check/repos.json; ls -alh /check"]
