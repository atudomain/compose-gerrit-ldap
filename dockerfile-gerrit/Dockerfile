FROM gerritcodereview/gerrit

USER root

COPY gerrit.config /
COPY secure.config /

COPY before-entrypoint.sh /
RUN chmod 700 /before-entrypoint.sh

ENTRYPOINT ["/before-entrypoint.sh"]
