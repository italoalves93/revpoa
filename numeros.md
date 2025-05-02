---
layout: page
title: Números
---

Arquivo de edições anteriores da Revista Porto Alegre.

## Edições

<ul class="issue-list">
  {% for issue in site.issues reversed %}
    <li class="issue-item">
      <a href="{{ issue.url | relative_url }}">
        <span class="issue-number">Edição {{ issue.issue_number }}</span>
        <span class="issue-date">{{ issue.date | date: "%B %Y" }}</span>
        {% if issue.theme %}
          <span class="issue-theme">{{ issue.theme }}</span>
        {% endif %}
      </a>
    </li>
  {% endfor %}
</ul>
