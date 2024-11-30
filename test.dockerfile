FROM ubuntu

CMD ["bash", "-lc", "ls -alh /check; touch /check/a.txt; ls -alh /check"]
