FROM ubuntu

RUN echo $A
RUN echo $B
RUN echo $C

CMD ["bash", "-lc", "ls -alh /check; touch /check/a.txt; cat /check/repos.json; ls -alh /check"]
