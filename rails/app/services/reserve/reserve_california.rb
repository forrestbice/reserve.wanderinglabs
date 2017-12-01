class Reserve::ReserveCalifornia
  attr_reader :availability_match, :site, :availability_request

  def initialize(availability_match)
    @availability_match = availability_match
    @site = availability_match.site
    @availability_request = availability_match.availability_request
  end

  def params
    {
      type: 'ReserveCalifornia',
      site_url: site_url,
      default_url: default_url,
      post: search_post_params,
    }
  end

  def arvdate
    availability_match.avail_date.strftime('%m/%d/%Y')
  end

  def site_url
    "https://www.reservecalifornia.com/CaliforniaWebHome/Facilities/UnitDetailPopup.aspx?facility_id=#{site.facility.rc_facility_id}&unit_id=#{site.ext_site_id}&arrival_date=#{arvdate}%2012:00:00%20AM&is_available=True"
  end

  def default_url
    'https://www.reservecalifornia.com/CaliforniaWebHome/Default.aspx'
  end

  def search_post_params
    {
      '__EVENTTARGET' => '',
      '__EVENTARGUMENT' => '',
      '__VIEWSTATE' => '/wEPDwUJNTYwNzY5OTkyD2QWAmYPDxYEHhJBcnJpdmFsRGF0ZURpc3BsYXkGAEAgd0441QgeC0Fycml2YWxEYXRlBgBAIHdOONUIZBYCZg8PFgIeFkZ1dHVyZUJvb2tpbmdTdGFydERhdGUGAEAgd0441QhkFghmD2QWAgIKDxYCHgRocmVmBU1odHRwczovL2NhbGktY29udGVudC51c2VkaXJlY3QuY29tL3RoZW1lcy9DYWxpZm9ybmlhL1N0eWxlcy9qcXVlcnktdWkubWluLmNzc2QCAg8PFgQeFEZ1dHVyZUJvb2tpbmdFbmREYXRlBgBAe0nAxdUIHgtNYXhpbXVtU3RheQIeZGQCAw9kFgYCBA8PFgQfAAYAQCB3TjjVCB8BBgBAIHdOONUIZBYIAgUPEA8WAh4LXyFEYXRhQm91bmRnZGRkZAIHDw8WAh4EVGV4dAUJMTIvMS8yMDE3ZGQCCA9kFgICAw8QDxYCHwZnZBAVHgExATIBMwE0ATUBNgE3ATgBOQIxMAIxMQIxMgIxMwIxNAIxNQIxNgIxNwIxOAIxOQIyMAIyMQIyMgIyMwIyNAIyNQIyNgIyNwIyOAIyOQIzMBUeATEBMgEzATQBNQE2ATcBOAE5AjEwAjExAjEyAjEzAjE0AjE1AjE2AjE3AjE4AjE5AjIwAjIxAjIyAjIzAjI0AjI1AjI2AjI3AjI4AjI5AjMwFCsDHmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZxYBZmQCCQ8PFgofAgYAQCB3TjjVCB8EBgBAe0nAxdUIHwEGAEAgd0441QgeC01pbmltdW1TdGF5AgEfBQIeZBYEZg8VAaQBL0NhbGlmb3JuaWFXZWJIb21lL0ZhY2lsaXRpZXMvQWR2YW5jZU1hcEltYWdlR2VuZXJhdG9yLmFzcHg/bWFwX2xldmVsPUVudGVycHJpc2UmbWFwX2lkPTAmYXJyaXZhbF9kYXRlPTEyLzEvMjAxNyZuaWdodHM9MCZybmQ9MTEzMzMwMzU0MiZ1bml0X3R5cGU9MCZ1bml0X2NhdGVnb3J5PTBkAgEPZBYEZg8VAwEwATAMbm9MZWdlbmQucG5nZAIBDxUCATAEdHJ1ZWQCBw8WAh8HBcYEPGxpIGNsYXNzPSJkcm9wZG93biI+DQoJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVzZXJ2ZWNhbGlmb3JuaWEuY29tL0NhbGlmb3JuaWFXZWJIb21lL0RlZmF1bHQuYXNweCI+DQoJCUhPTUUNCgk8L2E+DQo8L2xpPg0KPGxpIGNsYXNzPSJkcm9wZG93biI+DQoJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVzZXJ2ZWNhbGlmb3JuaWEuY29tL0NhbGlmb3JuaWFXZWJIb21lL0ZhY2lsaXRpZXMvQWR2YW5jZVNlYXJjaC5hc3B4Ij4NCgkJQ0FNUElORyBBTkQgTE9ER0lORw0KCTwvYT4NCjwvbGk+DQo8bGkgY2xhc3M9ImRyb3Bkb3duIj4NCgkJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVzZXJ2ZWNhbGlmb3JuaWEuY29tL0NhbGlmb3JuaWFXZWJIb21lL0FjdGl2aXRpZXMvUHJvZ3JhbXNBbmRUb3Vycy5hc3B4Ij4NCgkJCVRPVVJTDQoJCTwvYT48L2xpPg0KCQk8bGkgY2xhc3M9ImRyb3Bkb3duIj4NCgkJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVzZXJ2ZWNhbGlmb3JuaWEuY29tL0NhbGlmb3JuaWFXZWJIb21lL0FjdGl2aXRpZXMvSGVhcnN0Q2FzdGxlVG91cnMuYXNweCI+DQoJCQlIRUFSU1QgQ0FTVExFIFRPVVINCgkJPC9hPjwvbGk+ZAIRD2QWBgIDD2QWBAIHDxAPFgYeDkRhdGFWYWx1ZUZpZWxkBQRrZXlzHg1EYXRhVGV4dEZpZWxkBQZ2YWx1ZXMfBmdkEBUEE0NhbXBpbmcgYW5kIExvZGdpbmcTSGVhcnN0IENhc3RsZSBUb3VycxZPdGhlciBUb3Vycy9BY3Rpdml0aWVzGEJvYXQgTGF1bmNoIFJlc2VydmF0aW9ucxUEATEBNAEzATUUKwMEZ2dnZ2RkAgkPEGQQFR8AATEBMgEzATQBNQE2ATcBOAE5AjEwAjExAjEyAjEzAjE0AjE1AjE2AjE3AjE4AjE5AjIwAjIxAjIyAjIzAjI0AjI1AjI2AjI3AjI4AjI5AjMwFR8BMAExATIBMwE0ATUBNgE3ATgBOQIxMAIxMQIxMgIxMwIxNAIxNQIxNgIxNwIxOAIxOQIyMAIyMQIyMgIyMwIyNAIyNQIyNgIyNwIyOAIyOQIzMBQrAx9nZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnFgFmZAIEDxYCHglpbm5lcmh0bWwF3hc8c2VjdGlvbiBjbGFzcz0iYmFubmVyLXBhcnQiIHN0eWxlPSJkaXNwbGF5Om5vbmU7Ij4NCg0KICAgIA0KICAgIDxkaXYgY2xhc3M9InNsaWRlciBsYXp5Ij4NCiAgICANCiAgICAJPGRpdj4NCiAgICAgICAgICA8ZGl2IGNsYXNzPSJpbWFnZSI+IA0KICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWcxLmpwZyIgdGl0bGU9IkJhbm5lciBPbmUiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIE9uZSIgLz4gDQogICAgICAgICAgPC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgIA0KICAgIAk8ZGl2Pg0KICAgICAgICAgIDxkaXYgY2xhc3M9ImltYWdlIj4gDQogICAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwczovL2NhbGktY29udGVudC51c2VkaXJlY3QuY29tL3RoZW1lcy9DYWxpZm9ybmlhL0Jhbm5lcnMvaW1nMi5qcGciIHRpdGxlPSJCYW5uZXIgVHdvIiBhbHQ9IkJhbm5lciBmb3IgZGlzcGxheSBpbWFnZSBUd28iIC8+DQogICAgICAgICAgPC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgIA0KICAgIAk8ZGl2Pg0KICAgICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgICA8aW1nIHNyYz0iaHR0cHM6Ly9jYWxpLWNvbnRlbnQudXNlZGlyZWN0LmNvbS90aGVtZXMvQ2FsaWZvcm5pYS9CYW5uZXJzL2ltZzMuanBnIiB0aXRsZT0iQmFubmVyIFRocmVlIiBhbHQ9IkJhbm5lciBmb3IgZGlzcGxheSBpbWFnZSBUaHJlZSIgLz4NCiAgICAgICAgICAgIDwvZGl2Pg0KICAgICAgICA8L2Rpdj4NCiAgICANCiAgICAJPGRpdj4NCiAgICAgICAgICA8ZGl2IGNsYXNzPSJpbWFnZSI+IA0KICAgICAgICAgICAgICA8aW1nIHNyYz0iaHR0cHM6Ly9jYWxpLWNvbnRlbnQudXNlZGlyZWN0LmNvbS90aGVtZXMvQ2FsaWZvcm5pYS9CYW5uZXJzL2ltZzQuanBnIiB0aXRsZT0iQmFubmVyIEZvdXIiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIEZvdXIiIC8+DQogICAgICAgICAgPC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgIA0KICAgIAk8ZGl2Pg0KICAgICAgICAgIDxkaXYgY2xhc3M9ImltYWdlIj4gDQogICAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwczovL2NhbGktY29udGVudC51c2VkaXJlY3QuY29tL3RoZW1lcy9DYWxpZm9ybmlhL0Jhbm5lcnMvaW1nNS5qcGciIHRpdGxlPSJCYW5uZXIgRml2ZSIgYWx0PSJCYW5uZXIgZm9yIGRpc3BsYXkgaW1hZ2UgRml2ZSIgLz4NCiAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgPC9kaXY+DQogICAgDQogICAgCTxkaXY+DQogICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWc2LmpwZyIgdGl0bGU9IkJhbm5lciBTaXgiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIFNpeCIgLz4NCiAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgPC9kaXY+DQogICAgDQogICAgCTxkaXY+DQogICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWc3LmpwZyIgdGl0bGU9IkJhbm5lciBTZXZlbiIgYWx0PSJCYW5uZXIgZm9yIGRpc3BsYXkgaW1hZ2UgU2V2ZW4iIC8+DQogICAgICAgICAgPC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgIA0KICAgIAk8ZGl2Pg0KICAgICAgICAgIDxkaXYgY2xhc3M9ImltYWdlIj4gDQogICAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwczovL2NhbGktY29udGVudC51c2VkaXJlY3QuY29tL3RoZW1lcy9DYWxpZm9ybmlhL0Jhbm5lcnMvaW1nOC5qcGciIHRpdGxlPSJCYW5uZXIgRWlnaHQiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIEVpZ2h0IiAvPg0KICAgICAgICAgIDwvZGl2Pg0KICAgICAgICA8L2Rpdj4NCiAgICANCgkNCgkgCTxkaXY+DQogICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWc5LmpwZyIgdGl0bGU9IkJhbm5lciBGaXZlIiBhbHQ9IkJhbm5lciBmb3IgZGlzcGxheSBpbWFnZSBOaW5lIiAvPg0KICAgICAgICAgIDwvZGl2Pg0KICAgICAgICA8L2Rpdj4NCiAgICANCiAgICAJPGRpdj4NCiAgICAgICAgICA8ZGl2IGNsYXNzPSJpbWFnZSI+IA0KICAgICAgICAgICAgICA8aW1nIHNyYz0iaHR0cHM6Ly9jYWxpLWNvbnRlbnQudXNlZGlyZWN0LmNvbS90aGVtZXMvQ2FsaWZvcm5pYS9CYW5uZXJzL2ltZzEwLmpwZyIgdGl0bGU9IkJhbm5lciBTaXgiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIFRlbiIgLz4NCiAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgPC9kaXY+DQogICAgDQogICAgCTxkaXY+DQogICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWcxMS5qcGciIHRpdGxlPSJCYW5uZXIgU2V2ZW4iIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIEVsZXZlbiIgLz4NCiAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgPC9kaXY+DQogICAgDQogICAgCTxkaXY+DQogICAgICAgICAgPGRpdiBjbGFzcz0iaW1hZ2UiPiANCiAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vY2FsaS1jb250ZW50LnVzZWRpcmVjdC5jb20vdGhlbWVzL0NhbGlmb3JuaWEvQmFubmVycy9pbWcxMi5qcGciIHRpdGxlPSJCYW5uZXIgRWlnaHQiIGFsdD0iQmFubmVyIGZvciBkaXNwbGF5IGltYWdlIEVpZ2h0IiAvPg0KICAgICAgICAgIDwvZGl2Pg0KICAgICAgICA8L2Rpdj4NCgkNCgkNCiAgCTwvZGl2Pg0KICAgIA0KICAgIA0KICAgIA0KICAgIA0KICAgIA0KICAgIA0KPC9zZWN0aW9uPg0KIGQCBQ9kFgICBA8WAh8HBcciPGRpdiBjbGFzcz0iY29udGFpbmVyIj4NCiAgICA8ZGl2IGNsYXNzPSJyb3cgcHVsbC10b3AiPg0KICAgIA0KICAgICAgICA8ZGl2IGNsYXNzPSJjb2wtc20tNCI+DQogICAgICAgICAgICA8ZGl2IGNsYXNzPSJmZWF0dXJlLWJveCI+DQogICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImZlYXR1cmUtYm94LWluZm8iPg0KICAgICAgICAgICAgICAgICAgICAgICAgPGgyIHN0eWxlPSJmb250LWZhbWlseTogJ1NhdGlzZnknLCBjdXJzaXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGZvbnQtc2l6ZTogM2VtOyI+V2VsY29tZSB0byBSZXNlcnZlQ2FsaWZvcm5pYSZ0cmFkZTs8L2gyPg0KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJmZWF0dXJlLWJveC1pbWFnZSIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDMwcHg7Ij4NCiAgICAgICAgICAgICAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwczovL3d3dy5wYXJrcy5jYS5nb3YvSW1hZ2VzL2NvbnRlbnQvZmVhdHVyZWQvV2VsY29tZUltYWdlLmpwZyIgYWx0PSJXZWxjb21lIHRvIFJlc2VydmVDYWxpZm9ybmlhIiB0aXRsZT0iV2VsY29tZSB0byBSZXNlcnZlQ2FsaWZvcm5pYSIgLz4NCiAgICAgICAgICAgICAgICAgICAgPC9kaXY+DQogICAgICAgICAgICAgICAgICAgICAgICA8cD5XZWxjb21lIHRvIFJlc2VydmVDYWxpZm9ybmlhJnRyYWRlOy4gIE91ciBuZXcgc3lzdGVtIGlzIGVhc3kgdG8gdXNlIC0gc2ltaWxhciB0byBib29raW5nIGhvdGVscywgYWlybGluZSB0aWNrZXRzIGFuZCBvdGhlciBjb21wYXJhYmxlIHNlcnZpY2VzLiBBIHZhcmlldHkgb2YgbmV3IGZlYXR1cmVzIHdpbGwgYmUgcGhhc2VkIGluIGJldHdlZW4gQXVndXN0IDEsIDIwMTcgYW5kIE1hcmNoIDEsIDIwMTgsIGluY2x1ZGluZyBtb3ZpbmcgZnJvbSBhIGZpcnN0LW9mLXRoZS1tb250aCBvbi1zYWxlIGRheXMgdG8gYSBuZXcgcm9sbGluZyB3aW5kb3cgcmVzZXJ2YXRpb24gc2VydmljZS4gVGhpcyBtZWFucyB0aGF0IHlvdSB3aWxsIGJlIGFibGUgdG8gcmVzZXJ2ZSBjYW1wc2l0ZXMgYW5kIGxvZGdpbmcgc2l4IG1vbnRocyBpbiBhZHZhbmNlIGZyb20gdGhlIGN1cnJlbnQgZGF0ZS4gQm9vayB5b3VyIG5leHQgYWR2ZW50dXJlIHdpdGggdXMgLSA8YSBocmVmPSIuL0N1c3RvbWVycy9OZXdDdXN0b21lci5hc3B4Ij5jcmVhdGUgeW91ciBwcm9maWxlIGhlcmUuPC9hPjwvcD4NCiAgICAgICAgICAgICAgICAgICAgPC9kaXY+DQogICAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgPC9kaXY+DQoNCiAgICAgICAgPGRpdiBjbGFzcz0iY29sLXNtLTQiPg0KICAgICAgICAgICAgPGRpdiBjbGFzcz0iZmVhdHVyZS1ib3giPg0KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJmZWF0dXJlLWJveC1pbmZvIj4NCiAgICAgICAgICAgICAgICAgICAgICAgIDxoMiBzdHlsZT0iZm9udC1mYW1pbHk6ICdTYXRpc2Z5JywgY3Vyc2l2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyBmb250LXNpemU6IDNlbTsiPkZpbmQgWW91ciBSZXNlcnZhdGlvbjwvaDI+DQogICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImZlYXR1cmUtYm94LWltYWdlIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMzBweDsiPg0KICAgICAgICAgICAgICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vd3d3LnBhcmtzLmNhLmdvdi9JbWFnZXMvY29udGVudC9mZWF0dXJlZC9QZmVpZmZlckNhYmluLmpwZyIgYWx0PSJBZHZlbnR1cmUgb2YgdGhlIE1vbnRoIiB0aXRsZT0iQWR2ZW50dXJlIG9mIHRoZSBNb250aCIgLz4NCiAgICAgICAgICAgICAgICAgICAgPC9kaXY+DQogICAgICAgICAgICAgICAgICAgICAgICA8cD5SZXNlcnZhdGlvbnMgbWFkZSB0aHJvdWdoIFJlc2VydmVBbWVyaWNhIHByaW9yIHRvIEp1bHkgMjcsIDIwMTcgd2lsbCBiZSBhY2Nlc3NpYmxlIG9uIHRoZSBuZXcgc3lzdGVtIG9uIEF1Z3VzdCAxLiBUbyB2aWV3LCBtb2RpZnksIG9yIGNhbmNlbCB5b3VyIHJlc2VydmF0aW9uLCB5b3Ugd2lsbCBuZWVkIHRvIGxvZyBpbnRvIFJlc2VydmVDYWxpZm9ybmlhJnRyYWRlOyB1c2luZyB0aGUgZW1haWwgdGhhdCB3YXMgdXNlZCB3aGVuIHRoZSBvcmlnaW5hbCByZXNlcnZhdGlvbiB3YXMgY3JlYXRlZCBhbmQgdGhlbiByZXNldCB5b3VyIHBhc3N3b3JkLiBDdXN0b21lcnMgdGhhdCBkbyBub3QgaGF2ZSBhIGN1cnJlbnQgcmVzZXJ2YXRpb24gd2lsbCBuZWVkIHRvIGNyZWF0ZSBhIG5ldyBSZXNlcnZlQ2FsaWZvcm5pYSZ0cmFkZTsgYWNjb3VudC4gUGxhbiB5b3VyIG5leHQgYWR2ZW50dXJlIHdpdGggdXMgbm93IGFuZCA8YSBocmVmPSJqYXZhc2NyaXB0OnZvaWQoMCk7IiBvbmNsaWNrPSckKCIjbXlNb2RhbCIpLm1vZGFsKCk7Jz5sb2cgaW50byBvdXIgc3lzdGVtLjwvYT48L3A+DQogICAgICAgICAgICAgICAgICAgIDwvZGl2Pg0KICAgICAgICAgICAgPC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgICAgICANCiAgICAgICAgPGRpdiBjbGFzcz0iY29sLXNtLTQiPg0KICAgICAgICAgICAgPGRpdiBjbGFzcz0iZmVhdHVyZS1ib3giPg0KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJmZWF0dXJlLWJveC1pbmZvIj4NCiAgICAgICAgICAgICAgICAgICAgICAgIDxoMiBzdHlsZT0iZm9udC1mYW1pbHk6ICdTYXRpc2Z5JywgY3Vyc2l2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyBmb250LXNpemU6IDNlbTsiPlBhc3MgRXhjaGFuZ2UgUHJvZ3JhbTwvaDI+DQogICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJmZWF0dXJlLWJveC1pbWFnZSIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDMwcHg7Ij4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aW1nIHNyYz0iaHR0cHM6Ly93d3cucGFya3MuY2EuZ292L0ltYWdlcy9jb250ZW50L2ZlYXR1cmVkL1Bhc3NFeGNoYW5nZUljb24ucG5nIiBhbHQ9IlBhc3MgRXhjaGFuZ2UiIHRpdGxlPSJQYXNzIEV4Y2hhbmdlIFByb2dyYW0iIC8+DQogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgICAgICAgICAgICAgICAgIDxwPldlIGFyZSBtb2Rlcm5pemluZyB0aGUgd2F5IHdlIG1hbmFnZSB0aGUgRGlzdGluZ3Vpc2hlZCBWZXRlcmFuIGFuZCBEaXNhYmxlZCBEaXNjb3VudCBwYXNzIHByb2dyYW1zLiBOZXcgY3JlZGl0IGNhcmQgZGVzaWduIHBhc3NlcyBhcmUgYmVpbmcgaXNzdWVkIGZvciBjdXJyZW50IHBhc3MgaG9sZGVycy4gSWYgeW91IGhhdmUgb25lLCBwbGVhc2UgdmlzaXQgdXMgb25saW5lIG9yIHZpc2l0IG9uZSBvZiB0aGUgNDcgZGVzaWduYXRlZCBzdGF0ZSBwYXJrIGxvY2F0aW9ucyBzbyB0aGF0IHlvdSBtYXkgY29udGludWUgdG8gZWFzaWx5IGFjY2VzcyB5b3VyIGZhdm9yaXRlIHN0YXRlIHBhcmtzLiBOT1RFOiBDdXJyZW50IHZldGVyYW4gb3IgZGlzYWJsZWQgcGFzcyBob2xkZXJzIHdpbGwgbmVlZCBuZXcgcGFzc2VzIGZvciBjYW1waW5nIHJlc2VydmF0aW9ucyBhZnRlciBBdWd1c3QgMS4gSW5kaXZpZHVhbHMgbWF5IHVzZSB0aGVpciBjdXJyZW50IHBhc3MgZm9yIGRheSB1c2UgdGhyb3VnaCBGZWIuIDI4LCAyMDE4LiBPbGQgcGFzc2VzIHdpbGwgbm90IGJlIHZhbGlkIGFmdGVyIHRoZXNlIGRhdGVzLjxhIGhyZWY9Imh0dHA6Ly93d3cucGFya3MuY2EuZ292Lz9wYWdlX2lkPTI5NjEwIiB0YXJnZXQ9Il9ibGFuayI+IFZpZXcgZGV0YWlscy48L2E+PC9wPg0KICAgICAgICAgICAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgICAgIDwvZGl2Pg0KICAgICAgICA8L2Rpdj4NCiAgICAgICAgDQogICAgPC9kaXY+DQo8L2Rpdj4NCg0KPGRpdiBjbGFzcz0iY29udGFpbmVyIj4NCiAgICA8ZGl2IGNsYXNzPSJyb3ciIHN0eWxlPSJtYXJnaW4tdG9wOiAzMHB4OyI+DQoJCQk8cD5QbGVhc2UgY2hlY2sgb3V0IG91ciA8YSBocmVmPSJodHRwczovL3d3dy5wYXJrcy5jYS5nb3YvP3BhZ2VfaWQ9Mjk2NzYiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0idGV4dC1kZWNvcmF0aW9uOiB1bmRlcmxpbmU7Ij5mcmVxdWVudGx5IGFza2VkIHF1ZXN0aW9ucyAoRkFRcyk8L2E+IGZvciBkZXRhaWxzIG9uIHRoZSBuZXcgc3lzdGVtIG9yIDxhIGhyZWY9Imh0dHBzOi8vdmlzaXRvci5yMjAuY29uc3RhbnRjb250YWN0LmNvbS9tYW5hZ2Uvb3B0aW4/dj0wMDF2MnBoTzNCekgyVjVOaEcwWUhFWWthTnJWeVoyWTB6SlhCYXZib3VtNERDVEM0NFREcnI0bVptZ3A2NXg0WkszSTZ3NU12ZUktZk9HYkVoT2RvQkJPNENvS2ZPdllKTUxjdlg0cXZUVEhvbjBtWWpNX1E5c0pxUVQ5am1vblY2b3p1aVFUZ0taSmItTGVFYmFrVE5QM2ZyMzRNR0hjbW0tSUxvSDhqRGtHa00lM0QiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0idGV4dC1kZWNvcmF0aW9uOiB1bmRlcmxpbmU7Ij5zdWJzY3JpYmU8L2E+IHRvIG91ciBuZXdzIGZlZWQgdG8gcmVjZWl2ZSB0aGUgbGF0ZXN0IGluZm9ybWF0aW9uLjwvcD4NCgk8L2Rpdj4NCjwvZGl2PmQCBA8WAh8LBeUOPGZvb3Rlcj4NCjxkaXYgY2xhc3M9ImNvbnRhaW5lciI+DQo8ZGl2IGNsYXNzPSJyb3ciPg0KPGRpdiBjbGFzcz0iY29sLW1kLTEyIiBzdHlsZT0idGV4dC1hbGlnbjogY2VudGVyOyI+PGltZyBjbGFzcz0iZm90LWFyb3ciIHRpdGxlPSJkb3duIGFycm93IiBzcmM9Imh0dHBzOi8vd3d3LnJlc2VydmVjYWxpZm9ybmlhLmNvbS9DYWxpZm9ybmlhV2ViSG9tZS90aGVtZXMvQ2FsaWZvcm5pYS9mb290ZXItYXJyb3cuanBnIiBhbHQ9ImFlcnJvdyIgLz4NCjxkaXYgY2xhc3M9ImJvdC1saW5rcyBwYWdlbGlua3MiPjxhIGhyZWY9IkRlZmF1bHQuYXNweCI+SE9NRSA8L2E+IHwgPGEgaHJlZj0iRmFjaWxpdGllcy9BZHZhbmNlU2VhcmNoLmFzcHgiPkNBTVBJTkcgQU5EIExPREdJTkcgPC9hPiB8IDxhIGhyZWY9IkFjdGl2aXRpZXMvUHJvZ3JhbXNBbmRUb3Vycy5hc3B4Ij5BQ1RJVklUSUVTIDwvYT4gfCA8YSBocmVmPSJBY3Rpdml0aWVzL0hlYXJzdENhc3RsZVRvdXJzLmFzcHgiPkhFQVJTVCBDQVNUTEU8L2E+IHwgPCEtLSAgICAgIDxhIGhyZWY9IkdpZnRjYXJkcy9HaWZ0Y2FyZHNhbGUuYXNweCI+R0lGVCBDQVJEUzwvYT4NCiAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICAgIC0tPiAgPCEtLSAgICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICA8YSBocmVmPSJDdXN0b21lcnMvTmV3Q3VzdG9tZXIuYXNweCI+Q1JFQVRFIEFDQ09VTlQNCiAgICAgICAgICAgICAgICAgICAgPC9hPiAtLT48L2Rpdj4NCjxkaXYgY2xhc3M9ImJvdC1saW5rcyBjb2wtbWQtMTIiPjwhLS0gPGEgb25jbGljaz0iamF2YXNjcmlwdDp2YXIgcnVsZXM9d2luZG93Lm9wZW4oJycsICdydWxlcycsJ3dpZHRoPTYwMCwgaGVpZ2h0PTQwMCwgc2Nyb2xsYmFycz0xLCByZXNpemFibGU9MScpOyByZXR1cm4gZmFsc2U7IiB0YXJnZXQ9Il9ibGFuayIgIGhyZWY9ImphdmFzY3JpcHQ6dm9pZCgwKTsiPi0tPiA8YSBocmVmPSJodHRwOi8vd3d3LnBhcmtzLmNhLmdvdi8/cGFnZV9pZD0yMTMwMCIgdGFyZ2V0PSJfYmxhbmsiPiA8c3Ryb25nPlBBUksgUlVMRVMgPC9zdHJvbmc+IDwvYT4gfCA8YSBocmVmPSJodHRwczovL3d3dy5yZXNlcnZlY2FsaWZvcm5pYS5jb20vQ2FsaWZvcm5pYVdlYkhvbWUvQ29udGFjdFVzLmFzcHgiPiA8c3Ryb25nPkNPTlRBQ1QgVVMgPC9zdHJvbmc+IDwvYT4gfCA8YSBocmVmPSJodHRwOi8vd3d3LnBhcmtzLmNhLmdvdi9Qcml2YWN5IiB0YXJnZXQ9Il9ibGFuayI+IDxzdHJvbmc+UFJJVkFDWSBQT0xJQ1kgPC9zdHJvbmc+IDwvYT48L2Rpdj4NCjxiciAvPg0KPGRpdiBjbGFzcz0icm93Ij48c3BhbiBpZD0iTGFiZWwxIiBzdHlsZT0iY29sb3I6IHdoaXRlOyBmb250LXNpemU6IDEycHg7Ij5Db250YWN0IFVzOiAxLTgwMC00NDQtNzI3NSA4OjAwYW0gLSA2OjAwcG0gUGFjaWZpYyBUaW1lIChQVCkgPC9zcGFuPiA8IS0tICA8c3BhbiBzdHlsZT0iY29sb3I6IFdoaXRlOyBmb250LXNpemU6IDEycHg7IiBpZD0iTGFiZWwxIj5OZWVkIEhlbHA/IENhbGwgdXMgOCBBLk0uIHRvIDYgUC5NLiBEYWlseSA4MDAtNDQ0LTcyNzUgKENsb3NlZCBDaHJpc3RtYXMgRGF5LCBOZXcgWWVhcnMgRGF5LCBhbmQgVGhhbmtzZ2l2aW5nKTwvc3Bhbj4gIC0tPjwvZGl2Pg0KPGRpdiBjbGFzcz0icm93MSI+DQo8ZGl2IGNsYXNzPSJjb2wtbWQtMTIgY29sLXNtLTEyIGNvcHlyaWdodHMiPkNvcHlyaWdodCAmY29weTsgMjAxNyZuYnNwOyBTdGF0ZSBvZiBDYWxpZm9ybmlhPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iaW5jbHVkZUZvb3RlciI+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9mb290ZXI+ZGRRzwIFwo3j9XJNJFuuo/MyG+4nBXEH+q5EMlXhDI7/Yw==',
      '__VIEWSTATEGENERATOR' => '34651395',
      'ctl00$ctl00$Hidscreenresolutionmain' => '',
      'ctl00$ctl00$hdnCulture' => '',
      'ctl00$ctl00$AdvanceMainSearch$hdnAutoPlaceId' => site.facility.place_id,
      'ctl00$ctl00$AdvanceMainSearch$hdnautocomplete' => '',
      'ctl00$ctl00$AdvanceMainSearch$hdncustomautocomplete' => site.facility.details['parent'],
      'ctl00$ctl00$AdvanceMainSearch$hdnArrivalDate' => arvdate,
      'ctl00$ctl00$AdvanceMainSearch$txtArrivalDate' => '',
      'ctl00$ctl00$AdvanceMainSearch$hdnNights' => '1',
      'ctl00$ctl00$AdvanceMainSearch$ddlNights' => '1',
      'ctl00$ctl00$mainContent$indexValue' => '',
      'ctl00$ctl00$mainContent$hdnScreenresolution' => '1280',
      'ctl00$ctl00$mainContent$hdndefaultLat' => site.facility.details['lat'],
      'ctl00$ctl00$mainContent$hdnSearchPlaceName' => site.facility.details['parent'],
      'ctl00$ctl00$mainContent$hdndefaultLag' => site.facility.details['lng'],
      'ctl00$ctl00$mainContent$hdnMasterPlaceId' => site.facility.place_id,
      'ctl00$ctl00$mainContent$txtSearchparkautocomplete' => site.facility.details['parent'],
      'ctl00$ctl00$mainContent$ddlFacilityCategory' => '1',
      'ctl00$ctl00$mainContent$txtArrivalDate' => arvdate,
      'ctl00$ctl00$mainContent$ddlHomeNights' => availability_request.stay_length,
      'ctl00$ctl00$mainContent$btnSearch' => 'Go',
      'ctl00$ctl00$mainContent$homeContent$indexValue' => '',
    }
  end
end